<?php

namespace App\Http\Controllers\Customer\Auth;

use App\CPU\Helpers;
use App\Http\Controllers\Controller;
use App\Model\UserVerify;
use App\User;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Validator;

class RegisterController extends Controller
{
    public function __construct()
    {
        $this->middleware('guest:customer', ['except' => ['logout']]);
    }

    public function register()
    {
        session()->put('keep_return_url', url()->previous());
        return view('customer-view.auth.register');
    }

    public function submit(Request $request)
    {
        $validator = $request->validate([
            'email' => 'required|email|unique:users',
            'phone' => 'required|unique:users',
            'password' => 'min:6|required_with:con_password|same:con_password',
            'g-recaptcha-response' => 'required'
        ], [
            'email.email'        => 'Please provide a valid email address.',
            'email.required'     => 'The Email field is required.',
            'email.unique'       => 'This Email already exists.',
            'phone.required'     => 'The Phone Number field is required.',
            'phone.unique'       => 'This Phone Number already exists.',
            'password.min'       =>  "Password can not be less than 6 characters",
            //'con_password.min'   =>  "Password can not be less than 6 characters",
            'password.required'  => 'The Password field is required.',
            'password.same'      => 'The Password and Confirm Password field must be the same.',
            'password.required_with' => 'The Confirm Password field is required.',
            'g-recaptcha-response.required' => "Please complete the recaptcha",
        ]);
        

        $remoteip = $request->ip();
        $response = $request->input('g-recaptcha-response');
        $recaptcha_secret_key = "6LcPR_EkAAAAAGaK0-_x_a2ri72OQM2BRvJejh0f";
        $url = file_get_contents("https://www.google.com/recaptcha/api/siteverify?secret=$recaptcha_secret_key&response=$response&remoteip=$remoteip");
        $result = json_decode($url, true);
    
        // if($result['success'] != true OR $validator->fails()) {  
        //     $validator->getMessageBag()->add('recaptcha',  $result);
        //     if($request->ajax()){
        //         return response()->json(['errors' =>  $validator->errors()]);
        //     }
        //     return redirect()->back()->withErrors($validator->errors());
        // }
        
        // if ($request['password'] != $request['con_password']) {
        //     if($request->ajax()){
        //         return back()->with(['errors' =>  'password does not match.']);
        //     }
        //     return redirect()->back()->withErrors($validator->errors());
        // }

        if (session()->has('keep_return_url') == false) {
            session()->put('keep_return_url', url()->previous());
        }
      

        $data = new User;
        $data->f_name   = $request['f_name'];
        $data->name     = "$request->f_name $request->l_name ";
        $data->l_name   = $request['l_name'];
        $data->email    = $request['email'];
        $data->phone    = $request['phone'];
        $data->password = bcrypt($request['password']);
        $data->honey_pot= 1;
        $data->deleted_at= NULL;

        $createUser = $data->save();
        $token = Str::random(64);
        UserVerify::create([
            'user_id' => $data->id,
            'token' => $token
        ]);

        $message = \App\Model\BusinessSetting::where(['type' => 'user_registration'])->pluck('value')->first();

        if (str_contains($message, '!user')) {
            $message = str_replace('!user', "$request->l_name $request->f_name", $message);
        }

        send_mail($request->email, 'Email Verification', $message, route('user.verify', $token));


        if (auth('customer')->attempt(['email' => $request->email, 'password' => $request->password], $request->remember)) {
            // $this->hubspot();
            Toastr::success('Sign up process done successfully!');
            if($request->ajax()){
                return response()->json(['message' => 'Sign up process done successfully!', 'url' => session('keep_return_url')]); 
            }
            return redirect()->back()->with(['message' => 'Sign up process done successfully!', 'url' => session('keep_return_url')]);
        }
    }

    private function hubspot()
    {
        // add user to hustpost
        $hubspot = \SevenShores\Hubspot\Factory::create(env("HUBSPOT_API_KEY"));
        $contact = $hubspot->contacts()->create([
            'firstname' => request()->f_name,
            'lastname' => request()->l_name,
            'email' => request()->email,
            'phone' => request()->phone,
            'user_type' => "Customer"
        ]);
        $contact->properties->email->value;
        return true;
    }
}

