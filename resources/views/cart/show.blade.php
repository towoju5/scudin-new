@extends('layout.master')
@section('title', 'Shopping Cart')

@section('page_title')
<div class="page-heading">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <div class="page-title">
                    <h2>Shopping Cart</h2>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@section('content')
<!-- Main Container  -->
<div class="bg-white">
    <div id="container-fluid">
        @include('cart._summary')
    </div>
</div>
<!--Middle Part End -->
@stop