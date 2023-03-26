<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;

class Staff
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if (Auth::guard('staff')->check()) {
            if (!auth('staff')->user()->seller_code) {
                $email = auth('staff')->user()->email;
                auth()->logout();
                return redirect()
                    ->route('seller.auth.login')
                    ->with('message', 'Please contact your store owner for support');
            }
            return $next($request);
        }
        return redirect()->route('seller.auth.login');
    }
}
