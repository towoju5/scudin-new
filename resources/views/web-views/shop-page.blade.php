@extends('layout.master')
@section('title', $shop->name)


@push('css')
  <meta property="og:image" content="{{asset('storage/app/public/shop')}}/{{$shop->image}}" />
  <meta property="og:title" content="{{ $shop->name}} " />
  <meta property="og:url" content="{{route('shopView',[$shop['id']])}}">
  <meta property="og:description" content="{!! substr($web_config['about']->value,0,100) !!}">

  <meta property="twitter:card" content="{{asset('storage/app/public/shop')}}/{{$shop->image}}" />
  <meta property="twitter:title" content="{{route('shopView',[$shop['id']])}}" />
  <meta property="twitter:url" content="{{route('shopView',[$shop['id']])}}">
  <meta property="twitter:description" content="{!! substr($web_config['about']->value,0,100) !!}">
@endpush

@php $location = userLocation() @endphp
@section('content')
<div class="text-end p-2">
    <div class="container">
        Your shopping location is: {{ $location['cityName'] }}, {{ $location['regionName'] }}, {{ $location['countryName'] }}
    </div>
</div>

<section class="showcase2" style="background: url('{{asset($seller->image) ?? null}}');">
    <div class="container">
        <div class="showcase2-text pt-4 pb-4">
            <h2>{{ ucwords($shop->name )}}</h3>
                {{-- <p>Short Store Description</p> --}}
                <p class="pb-4"></p>
                <button class="btn btn1 px-5 my-4">Start Shopping</button>
        </div>
    </div>
</section>

<section class="seller-product p-2">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-3 col-sm-12 filter-product">
                <div class="my-3">
                    <a class="navbar-brand" href="#">
                        <img src="{{ asset($shop->image) }}" class="rounded-circle" width="60px" alt="" />
                        Seller Shop Logo
                    </a>
                </div>

                <div class="filter-sort mt-3 p-4">
                    <h3>Sort By</h3>
                    <div class="filter-latest dropdown sign-up px-3 py-1 my-3">
                        <select name="sort_by" class="form-control custom-select col sort_by" onchange="filter(this.value)">
                            <option value="latest">{{ __('Latest') }}</option>
                            <option value="low-high">{{ __('low_high') }} {{ __('Price') }}
                            </option>
                            <option value="high-low">{{ __('high_low') }} {{ __('Price') }}
                            </option>
                            <option value="a-z">{{ __('a_z') }} {{ __('Order') }}
                            </option>
                            <option value="z-a">{{ __('z_a') }} {{ __('Order') }}
                            </option>
                        </select>
                    </div>

                    <div class="price">
                        <h3>Price</h3>

                        <div class="budget d-flex">
                            <p class="p-2 px-3" style="background: #ffffff">{{ currency_symbol() }}</p>
                            <input type="number" placeholder="0" class="p-2 min_price" min="100" max="1000000" id="min_price" style="width: 100%" />
                        </div>

                        <p class="text-center">TO</p>

                        <div class="budget d-flex">
                            <p class="p-2 px-3" style="background: #ffffff">{{ currency_symbol() }}</p>
                            <input type="number" placeholder="0" class="p-2 max_price" min="100" max="1000000" id="max_price" style="width: 100%" />
                        </div>

                        <a class="budget-button btn btn1 btn-rounded my-4" onclick="searchByPrice()">Start Shopping</a>
                    </div>

                    <div class="brds">
                        <h3 class="my-3">Brands</h3>
                        <!-- <input type="text" placeholder="Search brand" class="py-2 px-3 mb-5" /> -->
                        <div class="input-group-overlay input-group-sm mb-2">
                            <input style="background: aliceblue" placeholder="Search brand" class="cz-filter-search form-control form-control-sm appended-form-control" type="text" id="search-brand">
                            <div class="input-group-append-overlay">
                                <span style="color: #3498db;" class="input-group-text">
                                    <i class="czi-search"></i>
                                </span>
                            </div>
                        </div>
                        <ul id="lista1" class="widget-list cz-filter-list list-unstyled pt-1" style="max-height: 12rem;" data-simplebar data-simplebar-auto-hide="false">
                            @foreach (\App\CPU\BrandManager::get_brands() as $brand)
                            <div class="for-brand-hover" id="brand">
                                <li style="cursor: pointer;padding: 2px" onclick="location.href='<?= route('products', ['id' => $brand['id'], 'data_from' => 'brand', 'page' => 1]) ?>'">
                                    <?= $brand['name'] ?>
                                    @if ($brand['brand_products_count'] > 0)
                                    <span class="for-count-value" style="float: right"><?= $brand['brand_products_count'] ?></span>
                                    @endif
                                </li>
                            </div>
                            @endforeach
                        </ul>
                    </div>
                </div>
            </div>

            <div class="col-lg-9 col-sm-12">
                <div class="top d-flex p-3">
                    <div class="">
                        <form action="" id="sellerProductSearch" style="max-width: max-content;">
                            <div class="input-group mb-3">
                                <input type="text" class="form-control border" placeholder="Search Seller Product" aria-label="Search Seller Product" aria-describedby="basic-addon2">
                                <div class="input-group-append">
                                    <span class="input-group-text btn btn-scudin" onclick="$('#sellerProductSearch').submit()" id="basic-addon2" style="position: inherit; ">
                                        <i class="fa-sharp fa-solid fa-magnifying-glass"></i>
                                    </span>
                                </div>
                            </div>
                        </form>
                        
                        @if (auth('customer')->id() == '')
                        <a href="{{route('customer.auth.login')}}" class="btn btn-scudin btn-block">
                            <i class="fa fa-envelope" aria-hidden="true"></i>
                            {{ __('Contact')}} {{ __('Seller')}}
                        </a>
                        @else
                        <button class="btn btn-scudin btn-block" data-toggle="modal" data-target="#exampleModal" onclick="$('#exampleModal').modal('show')">
                            <i class="fa fa-envelope" aria-hidden="true"></i>
                            {{ __('Contact')}} {{ __('Seller')}}
                        </button>
                        @endif
                    </div>
                </div>

                <div class="row">
                    <div class="slider d-flex gap-5">
                        @if(count($products) > 0)
                        @include('web-views.products._ajax-products',['products' => $products])

                        @else
                        <div class="text-center pt-5">
                            <h2>No Product Found</h2>
                        </div>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

@if (!empty($relatedProducts) && count($relatedProducts) > 0)
<section class="related-product my-5">
    <div class="container-fluid">
        <h4 class="my-5">Related Products</h4>
        <div class="row">
            <div class="col-12">
                <div class="slider d-flex gap-3 mb-2">
                    @foreach ($relatedProducts as $key => $viewed)
                    @php($overallRating = get_overall_rating($viewed->reviews))
                    <div class="product-card border bg-white p-2" style="width: 180px">
                        <a href="{{ route('product', $viewed->slug) }}" title="{{ $viewed->name }}" class="product-image">
                            <img src="{{ asset($viewed->thumbnail) }}" alt="..." width="160px" />
                        </a>

                        <div class="body mx-auto" style="width: 150px">
                            <a href="{{ route('product', $viewed->slug) }}" class="text-dark pb-2" title="{{ $viewed->name }}">
                                {{ Str::limit($viewed->name, 15, '...') }}
                            </a>
                            <div class="star d-flex">
                                @include('rating', ['r' => $overallRating[0] * 20])
                            </div>
                            <p class="mt-2">{{ \App\CPU\Helpers::get_price_range($viewed) }}</p>
                        </div>
                    </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
</section>
@endif

@if (!empty(recentlyViewed()) && count(recentlyViewed()) > 0)
<section class="featured-product my-5">
    <div class="container-fluid">
        <h4 class="my-5">Recently Viewed</h4>
        <div class="row">
            <div class="col-12">
                <div class="slider d-flex gap-3">
                    @foreach (recentlyViewed() as $viewed)
                    @php($overallRating = get_overall_rating($viewed->reviews))
                    <div class="product-card border bg-white p-2" style="width: 180px">
                        <a href="{{ route('product', $viewed->slug) }}" title="{{ $viewed->name }}" class="product-image">
                            <img src="{{ asset($viewed->thumbnail) }}" alt="..." width="160px" />
                        </a>

                        <div class="body mx-auto" style="width: 150px">
                            <a href="{{ route('product', $viewed->slug) }}" class="text-dark pb-2" title="{{ $viewed->name }}">
                                {{ Str::limit($viewed->name, 15, '...') }}
                            </a>
                            <div class="star d-flex">
                                @include('rating', ['r' => $overallRating[0] * 20])
                            </div>
                            <p class="mt-2">{{ \App\CPU\Helpers::get_price_range($viewed) }}</p>
                        </div>
                    </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
</section>
@endif

{{-- // contact seller modal --}}

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="padding: 20px;">
            <div class="card-header">
                Write Something
            </div>
            <div class="modal-body">
                <form action="{{route('messages_store')}}" method="post" id="chat-form">
                    @csrf
                    <input value="{{$shop->id}}" name="shop_id" hidden>
                    <input value="{{$shop->seller_id}}}" name="seller_id" hidden>

                    <textarea name="message" class="form-control"></textarea>
                    <br>
                    <button class="btn btn-scudin">
                        Send
                    </button>
                </form>
            </div>
            <div class="card-footer">
                <a href="{{route('chat-with-seller')}}" class="btn btn-scudin">
                    {{ __('go_to')}} {{ __('chatbox')}}
                </a>
                <button onclick="$('#exampleModal').modal('hide')" type="button" class="btn btn-secondary pull-right" data-dismiss="modal">Close
                </button>
            </div>
        </div>
    </div>
</div>
@endsection

@push('js')
<script>
        let min = $('.min_price').val();
        let max = $('.max_price').val();
        let sort_by = $('.sort_by').val();
        let data_from = "search";
        let data_name = ""
        let data_id = ""
        
    $('#chat-form').on('submit', function(e) {
        e.preventDefault();

        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
            }
        });

        $.ajax({
            type: "post",
            url: '{{route("messages_store")}}',
            data: $('#chat-form').serialize(),
            success: function(respons) {
                toastr.success('send successfully', {
                    CloseButton: true,
                    ProgressBar: true
                });
                $('#chat-form').trigger('reset');
            }
        });

    });

    function filter(value) {
        $.ajax({
            url: 'https://scudin.com/products',
            type: "GET",
            data: {
                id: data_id,
                name: data_name,
                data_from: data_from,
                min_price: min,
                max_price: max,
                sort_by: value
            },
            dataType: 'json',
            beforeSend: function() {
                $('#loading').show();
            },
            success: function(response) {
                $('#ajax-products').html(response.view);
            },
            complete: function() {
                $('#loading').hide();
            },
        });
    }

    function searchByPrice() {
        var min = $('.min_price').val();
        var max = $('.max_price').val();
        var sort_by = $('.sort_by').val();
        var data_from = "search";
        var data_name = ""
        var data_id = ""
        $.ajax({
            url: "https://scudin.com/products",
            type: "GET",
            data: {
                id: data_id,
                name: data_name,
                data_from: data_from,
                sort_by: sort_by,
                min_price: min,
                max_price: max,
            },
            dataType: 'json',
            beforeSend: function() {
                $('#loading').show();
            },
            success: function(response) {
                $('#ajax-products').html(response.view);
                $('#paginator-ajax').html(response.paginator);
            },
            complete: function() {
                $('#loading').hide();
            },
        });
    }

    $("#search-brand").on("keyup", function() {
        var value = this.value.toLowerCase().trim();
        $("#lista1 div>li").show().filter(function() {
            return $(this).text().toLowerCase().trim().indexOf(value) == -1;
        }).hide();
    });
    $("#search-brand-m").on("keyup", function() {
        var value = this.value.toLowerCase().trim();
        $("#lista1 div>li").show().filter(function() {
            return $(this).text().toLowerCase().trim().indexOf(value) == -1;
        }).hide();
    });
</script>
@endpush