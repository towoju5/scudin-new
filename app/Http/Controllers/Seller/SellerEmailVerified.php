<?php

namespace App\Http\Controllers\Seller;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Model\Category;

class SellerEmailVerified extends Controller
{
    public function verified()
    {
        $cats = Category::where('parent_id', 0)->orderBy('name', 'asc')->get();
        return view('seller-views.email.verify', compact('cats'));
    }
}
