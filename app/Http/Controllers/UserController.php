<?php

namespace App\Http\Controllers;

use App\Model\Seller;
use App\Model\Payment;
use App\Subscription;
use App\User;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;
use Omnipay\Omnipay;
use Omnipay\PayPal\RestGateway;
use Stevebauman\Location\Facades\Location;
use Stripe\Stripe;
use Stripe\StripeClient;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // return $ip = request()->ip(); //Dynamic IP address
        $ip = '162.159.24.227'; /* Static IP address */
        $currentUserInfo = Location::get($ip);

        return view('users.user', compact('currentUserInfo'));
    }

    public function calender()
    {
        return view('seller-views.system.calender');
    }

    public function subscription()
    {
        $plans = Subscription::where(['plan_user_type' => 'seller'])->orWhere(['plan_user_type' => 'all'])->get();
        return view('seller-views.system.subscription', compact(['plans']));
    }

    public function plans()
    {
        $curr_plan = Subscription::find(auth('customer')->user()->plan_id);
        $plans = Subscription::where(['plan_user_type' => 'users'])->orWhere(['plan_user_type' => 'all'])->orWhere(['plan_user_type' => 'customers'])->get();
        return view('web-views.plans', compact(['plans', 'curr_plan']));
    }

    public function activate($id)
    {

        $stripi = \App\CPU\Helpers::get_business_settings('stripe');
        $stripe = new StripeClient([
            'api_key' => $stripi['api_key'],
            'stripe_version' => '2020-08-27',
        ]);
        
        $plan_id = $id;
        $plan = Subscription::findOrFail($id);
        $userType = $plan->plan_user_type;
        $type = "ethos";

        if (auth('customer')->check()) {
            $user = User::find(auth('customer')->id());
        } elseif (auth('seller')->check()) {
            $user = Seller::find(auth('seller')->id());
        } else {
            return redirect()->back()->with('error', 'Invalid Plan selected!');
        }
        $order = [];
        $order['order_amount'] = $plan->plan_price;
        session()->put('__amount', $plan->plan_price);
        $metadata = [
            'plan_id' => $plan->id,
            'pay_type' => 'subscription',
        ];
        session()->put('metadata', $metadata);
        $payment_intent = $stripe->paymentIntents->create([
            'amount' => $plan->plan_price * 100,
            'currency' => 'USD',
            'metadata' => $metadata,
        ]);
        
        if ($plan->plan_price < 1) {
            // set user plan to free plan.
            $user->plan_id = $id;
            $user->save();
            return redirect()->back()->with('success', "Plan successfully set to free plan, Happy scudin 😄");
        } else {
            // user needs to pay for the said plan.
            return  view('web-views.checkout-payment', compact(['plan', 'userType', 'user', 'plan_id', 'type', 'payment_intent', 'order', 'stripi']));
        }
    }

    public function stripe_pay(Request $request)
    {
      /*
        $request->validate([
            'cc_num'    =>  'required',
            'cc_date'   =>  'required',
            'cc_cvv'    =>  'required'
        ], [
            'cc_num.required'   =>  'Credit card number is required',
            'cc_date.required'  =>  'Credit card Expiry Date is required',
            'cc_cvv.required'   =>  'Credit card CVV is required'
        ]);
        */
        
        $stripe = \App\CPU\Helpers::get_business_settings('stripe');
        $gateway = Omnipay::create('Stripe');
        $gateway->setApiKey($stripe['api_key']);
        $plan = Subscription::findOrFail(request()->plan_id);

        // '4242424242424242'
        $getExpDate = explode('/', request()->cc_date);
        $expiryMonth = $getExpDate[0] ?? NULL;
        $expiryYear = $getExpDate[1] ?? NULL;
        $formData = array('number' => request()->cc_num, 'expiryMonth' => $expiryMonth, 'expiryYear' => $expiryYear, 'cvv' => request()->cc_cvv);
        $response = $gateway->purchase(array('amount' => $plan->plan_price, 'currency' => 'USD', 'card' => $formData))->send();

        if ($response->isRedirect()) {
            // redirect to offsite payment gateway
            $response->redirect();
        } elseif ($response->isSuccessful()) {
            // payment was successful: update database
            $userType = $plan->plan_user_type;

            // $user = User::find(auth('customer')->id());

            $_final = route('plans.list');


            if (auth('customer')->check()) {
                $user = User::find(auth('customer')->id());
            } elseif (auth('seller')->check()) {
                $user = Seller::find(auth('seller')->id());
            } else {
                return redirect()->to('/');
            }

            $user->plan_id = $plan->id;
            if ($request->has('school_name')) {
                $user->tax_student_id = $request->tax_student_id;
            }
            if ($request->has('school_name')) {
                $user->school_name = $request->school_name;
            }
            if ($request->has('phone_number')) {
                $user->phone = $request->phone_number;
            }
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
            send_user_mail(auth('customer')->user()->email, ucwords($plan->plan_name) . " Purchased Successfully", $template, NULL, NULL, NULL, $template);

            Toastr::success('Plan updated successfully.');
            return redirect($_final);
            // print_r($response);
        } else {
            // payment failed: display message to customer
            echo $response->getMessage();
        }
    }

    public function paypalCheckout(Request $request)
    {
        $_final = route('plans.list');
        if (request()->input('payment_type') == 'stripe') {
            return $this->stripeCheckout($request);
        }

        $plan = Subscription::findOrFail(request()->plan_id);
        session()->put('su_plan_id', request()->plan_id);
        if (auth('customer')->check()) {
            $user = User::find(auth('customer')->id());
            $user_type = 'customer';
        } elseif (auth('seller')->check()) {
            $user = Seller::find(auth('seller')->id());
            $user_type = 'seller';
        } else {
            return redirect()->to('/');
        }

        $process_url = route('process.paypal.checkout') . '?ttprocessi=' . $plan->plan_price;
        $content = PaypalPaymentController::UserPlanPayment($plan->plan_price, $process_url);
            Payment::create([
                'order_id'    =>    "paypal-checkout-id-".rand(1001, 9999),
                'session_id'  =>    "paypal",
                'user_type'   =>    $user_type,
                'user_id'     =>    $user->id,
                'plan_id'     =>    $plan->id,
                'payment_method'=>  "Paypal",
                "payment_status"=>  "Pending",
                "order_amount"  =>  $plan->plan_price,
                "payment_type"  =>  "Plan Purchase",
            ]);

        if ($content->result->status === 'CREATED') {
            // return $content->result->links;
            return redirect()->to($content->result->links[1]->href);
        } else {
            Toastr::success($content->getMessage());
            return redirect($_final);
        }
    }

    public function stripeCheckout(Request $request)
    {
        $stripe = \App\CPU\Helpers::get_business_settings('stripe');
        Stripe::setApiKey($stripe['api_key']);
        header('Content-Type: application/json');
        $tranx_id = _getTransactionId();
        $plan = Subscription::findOrFail(request()->plan_id);
        $_finalAmountDue = $plan->plan_price;

        if (auth('customer')->check()) {
            $user = User::find(auth('customer')->id());
            $user_type = 'customer';
        } elseif (auth('seller')->check()) {
            $user = Seller::find(auth('seller')->id());
            $user_type = 'seller';
        } else {
            return redirect()->to('/');
        }
            $user->plan_id = $plan->id;
            if ($request->has('school_name')) {
                $user->tax_student_id = $request->tax_student_id;
            }
            if ($request->has('school_name')) {
                $user->school_name = $request->school_name;
            }
            if ($request->has('phone_number')) {
                $user->phone = $request->phone_number;
            }
            $user->save();

        $checkout_session = \Stripe\Checkout\Session::create([
            'line_items' => [[
                'price_data' => [
                    'currency' => "USD",
                    'product_data' => [
                        'name' => 'Plan Subscription',
                    ],
                    'unit_amount' => $_finalAmountDue * 100,
                ],
                'quantity' => 1,
            ]],
            'mode'                => 'payment',
            'client_reference_id' => $tranx_id,
            'customer_email'      => $user->email,
            'metadata'            => [
                'order_id'    =>    $tranx_id,
                'plan_id'     =>    $plan->id,
            ],
            'success_url'         => route('stripe.callback', $tranx_id)."?plan_id=$request->plan_id",
            'cancel_url'          => url('failed'),
        ]);
        // $result = result($checkout_session);
        if (!empty($checkout_session) && isset($checkout_session->url)) {
            Payment::create([
                'order_id'    =>    $tranx_id,
                'session_id'  =>    $checkout_session->id,
                'user_type'   =>    $user_type,
                'user_id'     =>    $user->id,
                'plan_id'     =>    $plan->id,
                'payment_method'=>  "Stripe",
                "payment_status"=>  "Pending",
                "order_amount"  =>  $_finalAmountDue,
                "payment_type"  =>  "Plan Purchase",
            ]);
            return redirect()->to($checkout_session->url);
        } else {
            return redirect()->to('/')->with('error', 'Unable to complete subscription payment, Please try again later');
        }
        // return response()->json($result);
    }


    /**
     * Cronjob for checking unpaid invoice and resolve them as failed.
     */
    public function stripe_webhook(Request $request, $payId)
    {
        $stripe = \App\CPU\Helpers::get_business_settings('stripe');
        $stripe = new \Stripe\StripeClient($stripe['api_key']);
        $paymentId = Payment::where('order_id', $payId)->first();

        if (empty($paymentId)) :
            die('Unknown action requested');
        endif;

        try {
            $event = $stripe->checkout->sessions->retrieve($paymentId->session_id);
            $amount = ($event->amount_total / 100);
            $paymentIntent = $event->payment_status;

            if ($paymentIntent == "paid") :
                // payment was successful: update database
                $plan = Subscription::findOrFail($request->plan_id);
                $userType = $plan->plan_user_type;
                // $user = User::find(auth('customer')->id());
                $paymentId->payment_status = 'Paid';
                $paymentId->save();
                $_final = route('plans.list');
                if (auth('customer')->check()) {
                    $user = User::find(auth('customer')->id());
                } elseif (auth('seller')->check()) {
                    $user = Seller::find(auth('seller')->id());
                } else {
                    return redirect()->to('/');
                }
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
                $mm_content .= "<tr><td>Plan Name</td><td>" . $plan->plan_name . "</td></tr>";
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
                    $receive_address = "$user->f_name $user->l_name <br> $user->phone";
                    $template = str_replace('!receive_address', $receive_address, $template);
                }
                send_user_mail($user->email, ucwords($plan->plan_name) . " Purchased Successfully", $template, NULL, NULL, NULL, $template);

                Toastr::success('Plan updated successfully.');
                return redirect($_final);
            else :
                $st = "failed";
            endif;
        } catch (\Stripe\Exception\InvalidRequestException $e) {
            die($e->getMessage());
        }
    }
}

