@extends('layout.master')
@section('title', 'wishList')

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
            @include('web-views.partials._wish-list-data', ['wishlists' =>$wishlists])
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