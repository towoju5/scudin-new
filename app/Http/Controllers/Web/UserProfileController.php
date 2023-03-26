<?php

namespace App\Http\Controllers\Web;

use App\CPU\CustomerManager;
use Illuminate\Support\Facades\Validator;
use App\CPU\OrderManager;
use App\Http\Controllers\Controller;
use App\Model\Order;
use App\Model\ShippingAddress;
use App\Model\SupportTicket;
use App\Model\Wishlist;
use App\Notifications\NewOrder;
use App\User;
use Barryvdh\DomPDF\Facade\Pdf as PDF;
use Brian2694\Toastr\Facades\Toastr;
use Carbon\Carbon;
use Dompdf\Adapter\PDFLib;
use Dompdf\Dompdf;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Facades\Image;

class UserProfileController extends Controller
{
    function __construct()
    {
        $this->middleware('verified');
    }
    
    function dashboard()
    {
        if (auth('customer')->check()) {
            $customerDetail = User::where('id', auth('customer')->id())->first();
            // $notif = [
            //     'title' =>  "Test Notification",
            //     'msg'   =>  "Your Order with ID 100001 has been placed successfully"
            // ];
            // $customerDetail->notify(new NewOrder($notif));
            return view('web-views.users-profile.dashboard', compact('customerDetail'));
        } else {
            return redirect()->route('home');
        }
    }

    public function user_account(Request $request)
    {
        if (auth('customer')->check()) {
            $customerDetail = User::where('id', auth('customer')->id())->first();
            return view('web-views.users-profile.account-profile', compact('customerDetail'));
        } else {
            return redirect()->route('home');
        }
    }

    public function user_update(Request $request)
    {

        $image = $request->file('image');

        if ($image != null && $request->hasFile('image')) {
            $data = getimagesize($image);
            // $imageName = Carbon::now()->toDateString() . "-" . uniqid() . "." . 'png';
            $imageName = save_image('profile', $request->image);

            User::where('id', auth('customer')->id())->update([
                'image' => $imageName,
            ]);
        }

        if ($request['password'] != $request['con_password']) {
            Toastr::error('Password did not match.');
            return back();
        }

        $userDetails = [
            'f_name'   => $request->f_name,
            'l_name'   => $request->l_name,
            'phone'    => $request->phone,
            'password' => strlen($request->password) > 5 ? bcrypt($request->password) : auth('customer')->user()->password,
        ];
        if (auth('customer')->check()) {
            User::where(['id' => auth('customer')->id()])->update($userDetails);
            Toastr::info(' your Profile is update!');
            return redirect()->back();
        } else {
            return redirect()->back();
        }
    }

    public function account_address()
    {
        if (auth('customer')->check()) {
            $shippingAddresses = \App\Model\ShippingAddress::where('customer_id', auth('customer')->id())->get();
            return view('web-views.users-profile.account-address', compact('shippingAddresses'));
        } else {
            return redirect()->route('home');
        }
    }

    public function address_store(Request $request)
    {
        $this->validate($request, [
            "name"   =>  'required',
            "addressAs"  =>  'required',
            "address"   =>  'required',
            "city"  =>  'required',
            "zip"   =>  'required',
            "phone" =>  'required',
            "state" =>  'required',
            "country"   =>  'required',
        ],[
            'name.required'  =>  ucwords("contact person name is required"),
            'addressAs.required' =>  ucwords("address type is required"),
            'address.required'  =>  ucwords("address is required"),
            'city.required' =>  ucwords("city is required"),
            'zip.required'  =>  ucwords("zip is required"),
            'phone.required'    =>  ucwords("phone is required"),
            'state.required'    =>  ucwords("state is required"),
            'country.required'  =>  ucwords("country is required"),
        ]);
        
        $address = [
            'customer_id'         => auth('customer')->check() ? auth('customer')->id() : null,
            'contact_person_name' => $request->name,
            'address_type'        => $request->addressAs,
            'address'             => $request->address,
            'city'                => $request->city,
            'zip'                 => $request->zip,
            'phone'               => $request->phone,
            'state'               => $request->state,
            'country'             => $request->country,
            'created_at'          => now(),
            'updated_at'          => now(),
        ];
        DB::table('shipping_addresses')->insert($address);
        return back();
    }

    public function address_update(Request $request)
    {
        $this->validate($request, [
            "name"   =>  'required',
            "addressAs"  =>  'required',
            "address"   =>  'required',
            "city"  =>  'required',
            "zip"   =>  'required',
            "phone" =>  'required',
            "state" =>  'required',
            "country"   =>  'required',
        ],[
            'name.required'  =>  ucwords("contact person name is required"),
            'addressAs.required' =>  ucwords("address type is required"),
            'address.required'  =>  ucwords("address is required"),
            'city.required' =>  ucwords("city is required"),
            'zip.required'  =>  ucwords("zip is required"),
            'phone.required'    =>  ucwords("phone is required"),
            'state.required'    =>  ucwords("state is required"),
            'country.required'  =>  ucwords("country is required"),
        ]);
        $addr = ShippingAddress::where('id', $request->id)->first();
            $addr->contact_person_name = $request->name;
            $addr->address_type        = $request->addressAs;
            $addr->address            = $request->address;
            $addr->city                = $request->city;
            $addr->zip                 = $request->zip;
            $addr->phone               = $request->phone;
            $addr->state              = $request->state;
            $addr->country             = $request->country;
            $addr->created_at          = now();
            $addr->updated_at          = now();
        $addr->save();
        if (auth('customer')->check()) {
            return redirect()->back();
        } else {
            return redirect()->back();
        }
    }

    public function address_delete(Request $request)
    {
        if (auth('customer')->check()) {
            ShippingAddress::destroy($request->id);
            return redirect()->back();
        } else {
            return redirect()->back();
        }
    }

    public function account_payment()
    {
        if (auth('customer')->check()) {
            return view('web-views.users-profile.account-payment');
        } else {
            return redirect()->route('home');
        }
    }

    public function account_oder()
    {
        $orders = Order::where('customer_id', auth('customer')->id())->latest()->paginate(10);
        return view('web-views.users-profile.account-orders', compact('orders'));
    }

    public function account_order_details(Request $request)
    {
        // $orders = Order::with(['sellerName', 'sellerName.seller'])->where('customer_id', auth('customer')->id())->get();
        // $shop = Shop::where($orders);
        // dd($orders);
        $order = Order::join('shipping_addresses', 'orders.shipping_address', '=', 'shipping_addresses.id')
            ->join('users', 'orders.customer_id', '=', 'users.id')
            ->select('orders.*', 'shipping_addresses.address', 'users.phone as customer_phone')
            ->where('orders.id', $request->id)
            ->first();
        $order_details = DB::table('order_details')->join('shipping_methods', 'order_details.shipping_method_id', '=', 'shipping_methods.id')->select('order_details.*', 'shipping_methods.cost')->where('order_id', $order->id)->get();
        // dd($order_details, $order);
        return view('web-views.users-profile.account-order-details', compact('order', 'order_details'));
    }

    public function account_wishlist()
    {
        if (auth('customer')->check()) {
            return $wishlists = Wishlist::with(['product'])->where('customer_id', auth('customer')->id())->get();
            return view('web-views.products.wishlist', compact('wishlists'));
        } else {
            return redirect()->route('home');
        }
    }

    public function account_tickets()
    {
        if (auth('customer')->check()) {
            $supportTickets = SupportTicket::where('customer_id', auth('customer')->id())->get();
            return view('web-views.users-profile.account-tickets', compact('supportTickets'));
        } else {
            return redirect()->route('home');
        }
    }

    public function ticket_submit(Request $request)
    {
        $ticket = [
            'subject'     => $request['ticket_subject'],
            'type'        => $request['ticket_type'],
            'customer_id' => auth('customer')->check() ? auth('customer')->id() : null,
            'priority'    => $request['ticket_priority'],
            'description' => $request['ticket_description'],
            'created_at'  => now(),
            'updated_at'  => now(),
        ];
        DB::table('support_tickets')->insert($ticket);
        return back();
    }

    public function single_ticket(Request $request)
    {
        $ticket = SupportTicket::where('id', $request->id)->first();
        return view('web-views.users-profile.ticket-view', compact('ticket'));
    }

    public function comment_submit(Request $request, $id)
    {
        $this->validate($request, [
          "comment" => "required"
        ]);
        DB::table('support_tickets')->where(['id' => $id])->update([
            'status'     => 'open',
            'updated_at' => now(),
        ]);

        DB::table('support_ticket_convs')->insert([
            'customer_message'  => $request->comment,
            'support_ticket_id' => $id,
            'position'          => 0,
            'created_at'        => now(),
            'updated_at'        => now(),
        ]);
        return back();
    }

    public function support_ticket_close($id)
    {
        DB::table('support_tickets')->where(['id' => $id])->update([
            'status'     => 'close',
            'updated_at' => now(),
        ]);
        Toastr::success('Ticket closed!');
        return redirect('/account-tickets');
    }

    public function account_transaction()
    {
        $customer_id = auth('customer')->id();
        $customer_type = 'customer';
        if (auth('customer')->check()) {
            $transactionHistory = CustomerManager::user_transactions($customer_id, $customer_type);
            return view('web-views.users-profile.account-transaction', compact('transactionHistory'));
        } else {
            return redirect()->route('home');
        }
    }

    public function support_ticket_delete(Request $request)
    {

        if (auth('customer')->check()) {
            $support = SupportTicket::find($request->id);
            $support->delete();
            return redirect()->back();
        } else {
            return redirect()->back();
        }
    }

    public function account_wallet_history($user_id, $user_type = 'customer')
    {
        $customer_id = auth('customer')->id();
        $customer_type = 'customer';
        if (auth('customer')->check()) {
            $wallerHistory = CustomerManager::user_wallet_histories($customer_id);
            return view('web-views.users-profile.account-wallet', compact('wallerHistory'));
        } else {
            return redirect()->route('home');
        }
    }

    public function track_order()
    {
        return view('web-views.order-tracking-page');
    }

    public function track_order_result(Request $request)
    {
        $orderDetails = OrderManager::track_order($request['order_id']);

        if (isset($orderDetails)) {
            $customer = User::find($orderDetails->customer_id);

            if ($orderDetails != null && $customer->phone == $request->phone_number) {
                return view('web-views.order-tracking', compact('orderDetails'));
            } else {
                return redirect()->route('track-order.index')->with('Error', 'Invalid Order Id or Phone Number');
            }
        } else {
            return redirect()->route('track-order.index')->with('Error', 'Invalid Order Id or Phone Number');
        }
    }

    public function track_last_order()
    {
        $orderDetails = OrderManager::track_order(Order::where('customer_id', auth('customer')->id())->latest()->first()->id);

        if ($orderDetails != null) {
            return view('web-views.order-tracking', compact('orderDetails'));
        } else {
            return redirect()->route('track-order.index')->with('Error', 'Invalid Order Id or Phone Number');
        }
    }

    public function generate_invoice($id)
    {
        $order = Order::with('shipping')->where('id', $id)->first();
        //        dd($order)->toArray();

        $data["email"] = $order->customer["email"];
        $data["client_name"] = $order->customer["f_name"] . ' ' . $order->customer["l_name"];
        $data["order"] = $order;

        // return view('web-views.invoice', compact('order'));

        
        $pdf = new Dompdf();
        $pdf->set_option('isRemoteEnabled', TRUE);
        $_view = view('web-views.invoice', $data);
        $pdf->loadHtml($_view, 'utf-8');

        // Render the HTML as PDF
        $pdf->render();

        // Output the generated PDF to Browser
        $pdf->stream('Invoice_' . $order->id . '.pdf');
    }
}
