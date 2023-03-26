<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Laravel\Socialite\Facades\Socialite;
use Exception;
use App\User;
use Illuminate\Support\Facades\Auth;

class SocialController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    //Google Login
    public function redirectToGoogle()
    {
        return Socialite::driver('google')->stateless()->redirect();
    }

    //Google callback  
    public function handleGoogleCallback()
    {
        try {
            $user = Socialite::driver('google')->stateless()->user();
            $this->_registerorLoginUser($user);
            return redirect()->route('home');
        } catch (\Throwable $th) {
            return redirect()->route('customer.auth.login');
        }
    }

    //Facebook Login
    public function facebookRedirect()
    {
        return Socialite::driver('facebook')->redirect();
    }

    //facebook callback  
    public function handleFacebookCallback()
    {
        try {
            $user = Socialite::driver('facebook')->user();
            $this->_registerorLoginUser($user);
            return redirect()->route('home');
        } catch (\Throwable $th) {
            return redirect()->route('customer.auth.login');
        }
    }

    //Github Login
    public function loginwithGitHub()
    {
        return Socialite::driver('github')->stateless()->redirect();
    }

    //github callback  
    public function handleGitHubCallback()
    {
        try {
            $user = Socialite::driver('github')->stateless()->user();
            $this->_registerorLoginUser($user);
            return redirect()->route('home');
        } catch (\Throwable $th) {
            return redirect()->route('customer.auth.login');
        }
    }

    //Github Login
    public function loginwithTwitter()
    {
        return Socialite::driver('twitter')->redirect();
    }

    //github callback  
    public function handleTwitterCallback()
    {
        try {
            $user = Socialite::driver('twitter')->user();
            $this->_registerorLoginUser($user);
            return redirect()->route('home');
        } catch (\Throwable $th) {
            return redirect()->route('customer.auth.login');
        }
    }

    protected function _registerOrLoginUser($data)
    {
        try {
            $count = User::where('email', $data->email)->count();
            $user = User::where(['email' => $data->email])->first();
            if (!$user) {
                $user = new User();
                $user->name = $data->name;
                $user->f_name = explode(' ', $data->name)[0];
                $user->l_name = explode(' ', $data->name)[1] ?? NULL;
                $user->email_verified_at = now();
                $user->is_email_verified = 1;
                $user->email = $data->email;
                $user->provider_id = $data->id;
                $user->image = $data->avatar;
                // $user->oauth_type = 'twitter';
                $user->password = encrypt('admin595959');
                $user->save();
            }
            auth('customer')->login($user, 1);
        } catch (\Throwable $th) {
            return redirect()->route('customer.auth.login');
        }
    }
}

