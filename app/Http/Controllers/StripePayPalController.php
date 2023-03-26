<?php

namespace App\Http\Controllers;

use App\Model\Order;
use App\Model\Seller;
use App\Subscription;
use App\User;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Omnipay\Omnipay;
use Stripe\StripeClient;
use Brian2694\Toastr\Facades\Toastr;

class StripePayPalController extends Controller
{
    public $gateway;

    public function __construct()
    {
        $this->gateway = Omnipay::create('PayPal_Pro');
        $this->gateway->setUsername(getenv('PAYPAL_API_USERNAME'));
        $this->gateway->setPassword(getenv('PAYPAL_API_PASSWORD'));
        $this->gateway->setSignature(getenv('PAYPAL_API_SIGNATURE'));
        $this->gateway->setTestMode(true);
    }

    public function checkout(Request $request, $method)
    {
        if ($method == 'stripe') {
            return $this->stripe($request);
        }

        if ($method == 'paypal') {
            return $this->paypal($request);
        }
    }

    private function stripe($request)
    {
        $stripi = \App\CPU\Helpers::get_business_settings('stripe');
        $stripe = new StripeClient([
            'api_key' => $stripi['api_key'],
            'stripe_version' => '2020-08-27',
        ]);
        $payment_intent = $stripe->paymentIntents->retrieve($request->payId);
        $orderId = $payment_intent->metadata->order_id;
        $payType = $payment_intent->metadata->pay_type;


        if ($payment_intent->status == 'succeeded') {
            // check if record exist for payment
            if ($payType == "order") {
                // user pay for a cart checkout
                // process cart as paid
                $this->process_order($orderId, $payment_intent);
            } else {
                // order type is plan payment
                $this->process_plan($orderId, $payment_intent);
            }
        } else {
            return redirect()->route('payment-fail');
        }
        // return response()->json($payment_intent);
        echo "Payment completd";
    }

    private function paypal($request)
    {
        // $stripe = \App\CPU\Helpers::get_business_settings('paypal');
        $arr_expiry = explode("/", $request->input('cc_exp'));
        $user = User::find(auth('customer')->id());
        $formData = [
            'firstName'     => $user->f_name,
            'lastName'      => $user->l_name,
            'number'        => $request->input('cc_num'),
            'expiryMonth'   => trim($arr_expiry[0]),
            'expiryYear'    => trim($arr_expiry[1]),
            'cvv'           => $request->input('cc_cvc')
        ];

        try {
            // Send purchase request
            if ($request->has('planId') && !empty($request->planId)) {
                $plan = Subscription::findOrFail(request()->planId);
                $amount = $plan->plan_price;
            } else {
                $order = Order::where('transaction_ref', session('transaction_ref'))->first();
                $amount = $order->order_amount;
            }
            $response = $this->gateway->purchase([
                'amount' => $amount,
                'currency' => 'USD',
                'card' => $formData
            ])->send();

            // var_dump($response); exit;

            // Process response
            if ($response->isSuccessful()) {
                // check if record exist for payment
                if ($request->has('planId') && !empty($request->planId)) {
                    // payment type was for plan checkout
                    $this->process_plan($plan->id, $response->getData());
                } else {
                    // user pay for a cart checkout // process cart as paid
                    $this->process_order($order->id, $response->getData());
                    $order->payment_method = "PayPal";
                    $order->save();
                }
                $arr_body = $response->getData();
                $amount = $arr_body['AMT'];
                $currency = $arr_body['CURRENCYCODE'];
                $transaction_id = $arr_body['TRANSACTIONID'];

                echo "Payment of $amount $currency is successful. Your Transaction ID is: $transaction_id";
                return redirect()->to(url('dashboard'));
            } else {
                // Payment failed
                echo "Payment failed. " . $response->getMessage();
            }
        } catch (Exception $e) {
            echo $e->getMessage();
        }
    }

    private function process_order($orderId, $payment_intent)
    {
        $order = Order::where('id', $orderId)->first();
        $order_id = $orderId;
        $orders = Order::where('id', $orderId)->update(['order_status' => 'processing', 'payment_status' => 'paid', 'payment_response' => json_encode($payment_intent)]);
        // send invoice to user
        $template = \App\Model\BusinessSetting::where(['type' => 'general_invoice'])->pluck('value')->first();
        if (str_contains($template, '!invoice_ID')) {
            $template = str_replace('!invoice_ID', $order_id, $template);
        }
        if (str_contains($template, '!item_info')) {
            $template = str_replace('!item_info', session('mm_content'), $template);
        }
        if (str_contains($template, '!total_price')) {
            $template = str_replace('!total_price', $order->order_amount, $template);
        }
        if (str_contains($template, '!receive_address')) {
            $user = auth('customer')->user();
            $receive_address = "$user->name <br> $user->phone";
            $template = str_replace('!receive_address', $receive_address, $template);
        }
        send_user_mail(auth('customer')->user()->email, "Order Placed Successfully. #$order_id", $template, NULL, NULL, NULL, $template);

        session()->forget('cart');
        session()->forget('coupon_code');
        session()->forget('coupon_discount');
        session()->forget('payment_method');
        session()->forget('shipping_method_id');
        session()->forget('mm_content');

        return true;
    }

    private function process_plan($planid, $payment_intent)
    {
        $_final = route('plans.list');
        $plan = Subscription::findOrFail($planid);
        if (auth('customer')->check()) {
            $user = User::findorFail(auth('customer')->id());
        } elseif (auth('seller')->check()) {
            $user = Seller::findorFail(auth('seller')->id());
        } else {
            return redirect()->to('/');
        }

        $user->plan_id = $plan->id;
        $user->save();

        $template = \App\Model\BusinessSetting::where(['type' => 'subscription_plan'])->pluck('value')->first();
        if (str_contains($template, '!user')) {
            $message = str_replace('!user', "$user->l_name $user->f_name", $template);
        }
        if (str_contains($template, '!plan')) {
            $message = str_replace('!plan',  $plan->plan_name, $template);
        }
        send_mail($user->email, 'Subscription Update', $message);
        // send invoice receipt to user

        $template = \App\Model\BusinessSetting::where(['type' => 'general_invoice'])->pluck('value')->first();
        $mm_content = "";
        $mm_content .= "<tr>
                <td>Plan Name</td>
                <td>" . $plan->plan_name . "</td>
            </tr>";
        if (str_contains($template, '!invoice_ID')) {
            $template = str_replace('!invoice_ID', _getTransactionId(), $template);
        }
        if (str_contains($template, '!item_info')) {
            $template = str_replace('!item_info', $mm_content, $template);
        }
        if (str_contains($template, '!total_price')) {
            $template = str_replace('!total_price', "USD $plan->plan_price", $template);
        }
        if (str_contains($template, '!receive_address')) {
            $user = auth('customer')->user();
            $receive_address = "$user->name <br> $user->phone";
            $template = str_replace('!receive_address', $receive_address, $template);
        }
        send_user_mail($user->email, ucwords($plan->plan_name) . " Purchased Successfully", $template, NULL, NULL, NULL, $template);

        Toastr::success('Plan updated successfully.');
    }

    public function success()
    {
        if (auth('customer')->check()) {
            Toastr::success('Payment success.');
            return redirect('/account-order');
        }
        return response()->json(['message' => 'Payment succeeded'], 200);
    }

    public function fail()
    {
        if (auth('customer')->check()) {
            Toastr::error('Payment failed.');
            return redirect('/account-order');
        }
        return response()->json(['message' => 'Payment failed'], 403);
    }
}
