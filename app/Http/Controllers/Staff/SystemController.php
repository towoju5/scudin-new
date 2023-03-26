<?php

namespace App\Http\Controllers\Staff;

use App\Http\Controllers\Controller;
use App\Model\WithdrawRequest;
use Illuminate\Http\Request;

class SystemController extends Controller
{
    public function dashboard(){
        return view('staff-views.system.dashboard');
    }
}
