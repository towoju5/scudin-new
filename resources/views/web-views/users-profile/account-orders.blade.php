@extends('layout.master')
@section('title', 'My orders')

@section('content')
<div class="container-fluid bg-white" style="padding: 0px 60px;">
@php $location = userLocation() @endphp
  <div class="row">
    <div class="container d-flex justify-content-between gap-2">
      <div class="page-title">
        <h6 class="mt-3">Find what you need here...</h6>
      </div>
      <div class="user-name-info h6 mt-3">
        Your shopping location is:   {{ $location['cityName'] }}, {{ $location['regionName'] }}, {{ $location['countryName'] }} 
      </div>
    </div>
  </div>
</div>
<section class="main-container mt-3">
  <div class="main container">
    <div class="row">
            <div class="welcome-msg">
              <p class="hello h4">Hello {{ auth('customer')->user()->l_name }},</p>
              <p>From your Account Dashboard you have the ability to view a snapshot of your recent account
                activity and update your account information. Select a link below to view or edit information.</p>
            </div>
      <section class="col-main col-sm-9 col-xs-12 wow bounceInUp animated animated" style="visibility: visible;">
        <div class="my-account">

          <!--page-title-->
          <!-- BEGIN DASHBOARD-->
          <div class="dashboard">
            <div class="recent-orders">
              <div class="title-buttons"> <strong>Recent Orders</strong> <?php /* <a href="#">View All</a> */ ?></div>
              <div class="table-responsive bg-white p-3">
                <table class=table table-striped" id="my-orders-table">

                  <thead>
                    <tr class="first last">
                      <th>{{ __('Order#') }} </th>
                      <th>{{ __('Seller') }}</th>
                      <th>{{ __('Order')}} {{ __('Date') }}</th>
                      <th><span class="nobr">{{ __('Order') }} {{ __('Total') }}</span></th>
                      <th> {{ __('Status') }}</th>
                      <!-- <th>Status</th> -->
                      <th>&nbsp;</th>
                    </tr>
                  </thead>
                  <tbody>
                    @forelse($orders as $order)
                    <tr class="first odd">
                      @if($order['id']>0)
                      <td class="bodytr font-weight-bold">
                        {{ __('ID')}}: {{$order['id']}}
                      </td>
                      <td class="sellerName">
                        <span class="">
                          {{ $order->sellerName ? $order->sellerName->seller ? $order->sellerName->seller->f_name. ' '.$order->sellerName->seller->l_name : "Scudin" : "Not Set" }}
                        </span>
                      </td>
                      <td class="bodytr orderDate"><span class="">{{$order['created_at']}}</span></td>
                      
                      <td class="bodytr">
                        {{\App\CPU\Helpers::currency_converter($order['order_amount'])}}
                      </td>
                      
                      <td class="bodytr">
                        <span class="badge rounded-pill bg-info" style="padding: 10px">
                          {{ $order->order_status }}
                        </span>
                      </td>
                      
                      <td class="bodytr">
                        <a href="{{ route('account-order-details', ['id'=>$order->id]) }}" class="btn btn-primary">
                          <i class="fas fa-eye"></i>
                        </a>
                      </td>
                      @else

                      <td></td>
                      <td></td>
                      <td>
                        <center class="mt-3 mb-2"> NO Order Found</center>

                      </td>
                      <td></td>
                      <td></td>

                      @endif
                    </tr>
                    @empty
                    <tr>
                      <td colspan="6">
                        <h3 style="text-align: center">No Orders Yet. Kindly Place Order to get started!</h3>
                      </td>
                    </tr>
                    @endforelse
                  </tbody>
                </table>
              </div>
              <div class="row">
                {{ $orders->render('pagination') }}
              </div>
            </div>
          </div>
        </div>
      </section>
      <!--col-main col-sm-9 wow bounceInUp animated-->
      <aside class="col-right sidebar col-sm-3 col-xs-12 wow bounceInUp animated animated" style="visibility: visible;">
        @include('web-views.users-profile.partials._sidebar')
      </aside>
      <!--col-right sidebar col-sm-3 wow bounceInUp animated-->
    </div>
    <!--row-->
  </div>
  <!--main container-->
</section>
<style>
  .lni {
    size: 24px;
  }
</style>
@stop