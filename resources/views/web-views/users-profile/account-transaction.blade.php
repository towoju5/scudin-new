@extends('layout.master')
@section('title', 'Transaction History')

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
      <section class="col-main col-sm-9 col-xs-12 wow bounceInUp animated animated" style="visibility: visible;">
        <div class="my-account">

          <!--page-title-->
          <!-- BEGIN DASHBOARD-->
          <div class="dashboard">
            <div class="box-shadow-sm">
              <div class="table-responsive" style="overflow: auto">
                <table class="table table-striped table-bordered">
                  <thead>
                    <tr style="background: <?= $web_config['secondary_color'] ?>">
                      <td class="tdBorder">
                        <div class="py-2"><span class="d-block spandHeadO ">{{ __('Tranx')}} {{ __('ID')}}</span></div>
                      </td>
                      <td class="tdBorder">
                        <div class="py-2 ml-2"><span class="d-block spandHeadO ">{{ __('payment_method')}}</span></div>
                      </td>
                      <td class="tdBorder">
                        <div class="py-2"><span class="d-block spandHeadO">{{ __('Status')}} </span></div>
                      </td>
                      <td class="tdBorder">
                        <div class="py-2"><span class="d-block spandHeadO"> {{ __('Total')}}</span></div>
                      </td>
                    </tr>
                  </thead>

                  <tbody>
                    @forelse($transactionHistory as $history)
                    <tr>
                      <td class="bodytr font-weight-bold" style="color: #92C6FF;"><span class="marl">{{$history['id']}}</span></td>
                      <td class="sellerName bodytr "><span class="">{{$history['payment_method']}}</span></td>
                      <td class="bodytr"><span class="">{{$history['payment_status']}}</span></td>
                      <td class="bodytr"><span class=" amount ">{{\App\CPU\Helpers::currency_converter($history->order_amount)}}</span></td>
                    </tr>
                    @empty
                    <tr>
                      <td colspan="4" class="text-center">
                        <h3>Transaction History is Empty</h3>
                      </td>
                    </tr>
                    @endforelse
                  </tbody>
                </table>
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
@stop