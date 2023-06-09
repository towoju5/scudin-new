<?php

namespace App\Http\Controllers;

use App\CPU\CartManager;
use App\CPU\Helpers;
use App\Model\Order;
use App\Model\Product;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use PHPUnit\Exception;
use Stripe\Charge;
use Stripe\Stripe;

class StripePaymentController extends Controller
{
    public function paymentProcess()
    {
        if (session()->has('payment_mode') && session('payment_mode') == 'app') {
            $order_id = session('order_id');
        } else {
            #----------------- Recalculate cart price to avoid smart ass dude --------------------
            $collection = request()->session()->get('cart', collect([]));
            foreach ($collection as $key => $value) {
                $collection = getFinalPrice($collection, $key);
            }
            request()->session()->put('cart', $collection);

            #------------------------------------ End Recalculate ---------------------------------
            $mm_content = "";
            $customer_info = session('customer_info');
            $cart = session('cart');
            $coupon_discount = session()->has('coupon_discount') ? session('coupon_discount') : 0;

            $tran = Str::random(6) . '-' . rand(1, 1000);
            session()->put('transaction_ref', $tran);
            $mm_total = CartManager::cart_grand_total($cart) - $coupon_discount;
            $order_id = DB::table('orders')
                ->insertGetId([
                    'id' => 100000 + Order::all()->count() + 1,
                    'customer_id' => auth('customer')->id(),
                    'customer_type' => 'customer',
                    'payment_status' => 'unpaid',
                    'order_amount' => $mm_total,
                    'order_status' => 'pending',
                    'payment_method' => 'Stripe',
                    'discount_amount' => session()->has('coupon_discount') ? session('coupon_discount') : 0,
                    'discount_type' => session()->has('coupon_discount') ? 'coupon_discount' : '',
                    'transaction_ref' => $tran,
                    'shipping_address' => $customer_info['address_id'],
                    'created_at' => now(),
                    'updated_at' => now(),
                ]);
            foreach ($cart as $c) {
                $product = Product::where('id', $c['id'])->first();
                $or_d = [
                    'order_id' => $order_id,
                    'product_id' => $c['id'],
                    'seller_id' => $product->added_by == 'seller' ? $product->user_id : '0',
                    'product_details' => $product,
                    'qty' => $c['quantity'],
                    'price' => $c['price'],
                    'tax' => $c['tax'] * $c['quantity'],
                    'discount' => $c['discount'] * $c['quantity'],
                    'discount_type' => 'discount_on_product',
                    'variant' => $c['variant'],
                    'variation' => json_encode($c['variations']),
                    'delivery_status' => 'pending',
                    'shipping_method_id' => $c['shipping_method_id'],
                    'payment_status' => 'unpaid',
                    'created_at' => now(),
                    'updated_at' => now()
                ];
                $mm_content .= "<tr>
                                <td>". $product->name ."</td>
                                <td>". $c['price'] ."</td>
                            </tr>";
                DB::table('order_details')->insert($or_d);
            }
        }

        return [
            "order_id"  =>  $order_id,
            "mm_content"=>  $mm_content,
            'transaction_ref'=> $tran
        ];

        try {
            $config = Helpers::get_business_settings('stripe');
            Stripe::setApiKey($config['api_key']);
            $token = $_POST['stripeToken'];
            $payment = Charge::create([
                'amount' => (Order::find($order_id)->order_amount) * 100,
                'currency' => 'usd',
                'description' => $tran,
                'source' => $token
            ]);
        } catch (Exception $exception) {
            Toastr::error('Gateway configuration problem.');
            return back();
        }

        if ($payment->status == 'succeeded') {
            DB::table('orders')
                ->where('transaction_ref', $tran)
                ->update(['order_status' => 'processing', 'payment_status' => 'paid']);
                // send invoice to user
                $template = \App\Model\BusinessSetting::where(['type' => 'general_invoice'])->pluck('value')->first();                
                if (str_contains($template, '!invoice_ID')) {
                    $template = str_replace('!invoice_ID', $order_id, $template);
                }
                if (str_contains($template, '!item_info')) {
                    $template = str_replace('!item_info', $mm_content, $template);
                }
                if (str_contains($template, '!total_price')) {
                    $template = str_replace('!total_price', $mm_total, $template);
                }
                if (str_contains($template, '!receive_address')) {
                    $user = auth('customer')->user();
                    $receive_address = "$user->name <br> $user->phone";
                    $template = str_replace('!receive_address', $receive_address, $template);
                }
               send_user_mail(auth('customer')->user()->email, "Order Placed Successfully. #$order_id", $template, NULL, NULL, NULL, $template);
        }

        if ($payment->status == 'succeeded' && session()->has('payment_mode') && session('payment_mode') == 'app') {
            
            return redirect()->route('payment-success');
        } elseif ($payment->status != 'succeeded' && session()->has('payment_mode') && session('payment_mode') == 'app') {
            return redirect()->route('payment-fail');
        }

        session()->forget('cart');
        session()->forget('coupon_code');
        session()->forget('coupon_discount');
        session()->forget('payment_method');
        session()->forget('shipping_method_id');

        return view('web-views.checkout-complete', compact('order_id'));
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
