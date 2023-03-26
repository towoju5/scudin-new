<?php

namespace App\Http\Controllers;

use App\CrudEvents;
use App\Model\Order;
use App\Model\OrderDetail;
use App\User;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;
use Stripe\OrderItem;

class CalenderController extends Controller
{
    public function __construct()
    {/*
        if(auth('seller')->check()) {
            $this->active = auth('seller')->id();
        } else if(auth('staff')->check()) {
            $this->active = auth('staff')->user()->seller_code;
        } else {
            abort(401);
        } */
    }
    
    public function index()
    {
        return back();
    }

    public function calender(Request $request)
    {
        if(auth('seller')->check()) {
            $active = auth('seller')->id();
        } else if(auth('staff')->check()) {
            $active = auth('staff')->user()->seller_code;
        } else {
            abort(401);
        }
     
        $events = CrudEvents::where('seller_id', $active)->get();
        if ($request->ajax()) {
            return response()->json($events);
        }
        return view('seller-views.system.calender', compact('events'));
    }

    public function calendarEvents(Request $request)
    {
        if(auth('seller')->check()) {
            $active = auth('seller')->id();
        } else if(auth('staff')->check()) {
            $active = auth('staff')->user()->seller_code;
        } else {
            abort(401);
        }
     
        $event = CrudEvents::where('seller_id', $active)->get();
        switch ($request->type) {
            case 'create':
                $event = CrudEvents::create([
                    'title'         => $request->title,
                    'label'         => $request->label,
                    'event_url'     => $request->event_url,
                    'seller_id'     => $active,
                    'customer'      => $request->customer,
                    'start_date'    => $request->start_date,
                    'end_date'      => $request->end_date,
                    'description'   => $request->description,
                ]);
                return response()->json($event);
                break;

            case 'edit':
                $event = CrudEvents::find($request->id)->update([
                    'title'         => $request->title,
                    'label'         => $request->label,
                    'event_url'     => $request->event_url,
                    'seller_id'     => $request->seller_id,
                    'customer_id'   => $request->customer_id,
                    'start_date'    => $request->start_date,
                    'end_date'      => $request->end_date,
                    'desription'    => $request->desription,
                ]);

                return response()->json($event);
                break;

            case 'delete':
                $event = CrudEvents::find($request->id)->delete();
                return response()->json($event);
                break;

            default:
                $event = CrudEvents::create([
                    'title'         => $request->title,
                    'label'         => $request->label,
                    'event_url'     => $request->event_url,
                    'seller_id'     => $active,
                    'customer'      => $request->customer,
                    'start'         => $request->start_date,
                    'end'           => $request->end_date,
                    'description'   => $request->description,
                ]);
                return response()->json($event);
                break;
        }
    }
}
