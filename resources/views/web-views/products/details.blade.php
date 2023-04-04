@extends('layout.master')

@section('title', $product->name)
@push('css')
    <link rel="stylesheet" href="{{ asset('new/slider.css') }}">
    <style>
        .pointer {
            cursor: pointer;
        }
        .custom button.items-count {
            background-color: var(--golden-scudin);
            border: none;
            transition: color 300ms ease-in-out 0s, background-color 300ms ease-in-out 0s, background-position 300ms ease-in-out 0s;
            color: #333;
            font-size: 10px;
            line-height: normal;
            padding: 15px 15px 12px 15px;
            line-height: normal;
            border-radius: 999px;
        }
        .wrapped-cartty .qty {
            padding: 0 5px 1px;
            height: 44px;
            border: none;
            text-align: center;
            width: 45px;
            color: #aaa;
            vertical-align: top;
            background: #eaeaea;
            border-radius: 999px;
        }
        input[type="radio"] {
            appearance: none;
            border: 1px solid #d3d3d3;
            width: 30px;
            height: 30px;
            content: none;
            outline: none;
            margin: 0;
            box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
        }

        input[type="radio"]:checked {
            appearance: none;
            outline: none;
            padding: 0;
            content: none;
            border: none;
        }

        input[type="radio"]:checked::before {
            position: absolute;
            color: green !important;
            content: "\00A0\25C9\00A0" !important;
            border: 1px solid #d3d3d3;
            font-weight: bolder;
            font-size: 21px;
        }

        .radio_item {
            display: none !important;
        }

        .label_item {
            opacity: 1;
        }

        .radio_item:checked+label {
            opacity: 1;
            background: var(--golden-scudin);
        }

        label {
            cursor: pointer;
        }
    </style>
@endpush

@section('content')

    <?php
    if (!empty($product)) {
        $overallRating = \App\CPU\ProductManager::get_overall_rating($product->reviews);
        $rating = \App\CPU\ProductManager::get_rating($product->reviews);
    }
    ?>
    <section class="m-2"></section>
    <section class="order">
        <form id="add-to-cart-form">
            <div class="container-fluid">
                <div class="row">
                    @if ($product->images != null)
                        @php $photos = json_decode($product->images) @endphp
                        <div class="col-lg-5">
                            <div class="product-imgs bg-white">
                                <div class="img-display">
                                    <div class="img-showcase">
                                        @foreach ($photos as $key => $photo)
                                            <img src='{{ asset("storage/app/public/product/$photo") }}'
                                                alt="{{ $product->name }}">
                                        @endforeach
                                    </div>
                                </div>
                                <div class="img-select border slider">
                                    @foreach ($photos as $k => $image)
                                        <div class="img-item">
                                            <a href="#" data-id="{{ $k + 1 }}">
                                                <img src='{{ asset("storage/app/public/product/$image") }}'
                                                    style="max-height: 80px; width:" alt="{{ $product->name }}">
                                            </a>
                                        </div>
                                    @endforeach
                                </div>
                            </div>
                        </div>
                    @endif
                    <div class="col-lg-7 ml-1 bg-white">
                        <div class="order-name">
                            <h1 class="my-3">
                                {{ $product->name }}
                            </h1>
                            <div class="order-star d-flex">
                                @include('rating', ['r' => $overallRating[0] * 20])
                                <p class="ms-4 px-4">Total of {{ $overallRating[1] }} Reviews</p>
                            </div>
                        </div>

                        <form id="add-to-cart-form">
                            @csrf
                            <div class="row mt-5">
                                <div class="col-lg-6 col-sm-12 order-overview">
                                    <h3>Quick Overview</h3>
                                    <h1>{{ \App\CPU\Helpers::get_price_range($product) }}</h1>
                                    <li>Sold By:
                                        <a href="{{ route('shopView', [$product->seller->id]) }}">
                                            <span
                                                class="status-stock text-primary">{{ $product->seller->shop->name }}</span>
                                        </a>
                                    </li>
                                    <li>Tax:
                                        {{ \App\CPU\Helpers::currency_converter(\App\CPU\Helpers::tax_calculation($product->unit_price, $product->tax, $product->tax_type)) }}
                                        ( {{ $product['tax'] }}%)</li>
                                    @if (isset($product->brand->name))
                                        <li>Brand: {{ $product->brand->name }}</li>
                                    @endif
                                    <li>Product Code: {{ uniqid($product->id . '-') }}</li>

                                    <h4 class="mt-3" style="color: #5433FF">Select Purchase Option</h4>
                                    @if(session()->has('cart') && count( session()->get('cart')) > 0)
                                    @else
                                    <small class="shipping_method" onclick="$('#shippingMethod').modal('show')">
                                        Choose Shipping Method
                                    </small> 
                                    <small id="shippingOption"></small>
                                    <!-- Modal -->
                                    <div class="modal fade" id="shippingMethod" role="dialog">
                                        <div class="modal-dialog modal-md">
                                            <!-- Modal content-->
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <!-- modal header  -->
                                                    <button type="button" class="close btn btn-danger"
                                                        onclick="$('#shippingMethod').modal('hide')"
                                                        data-dismiss="modal">&times;</button>
                                                    <h4 class="modal-title" style="padding-bottom: 15;">Select Shipping Method</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <ul class="list-group">
                                                        @if (auth('customer')->check() && ($product->added_by == 'admin' || check_ethos($product->seller->id) !== false))
                                                            <li class="list-group-item" style="cursor: pointer;"
                                                                onclick="$('#sh-1').prop( 'checked', true )">
                                                                <input type="radio" checked name="shipping_method_id"
                                                                    class="_shipping" id="sh-1" value="1">
                                                                <span class="checkmark" style="margin-right: 10px"></span> Ethos Free Shipping
                                                            </li>
                                                        @endif
                                                        @foreach (\App\CPU\ProductManager::get_shipping_methods($product) as $key => $shipping)
                                                            <li class="list-group-item" style="cursor: pointer;"
                                                                onclick="$('#sh-{{ $shipping->id }}').prop( 'checked', true )">
                                                                <input type="radio" name="shipping_method_id"
                                                                    class="_shipping" id="sh-{{ $shipping['id'] }}"
                                                                    value="{{ $shipping['id'] }}">
                                                                <span class="checkmark" style="margin-right: 10px"></span>
                                                                {{ $shipping['title'] }}
                                                            </li>
                                                        @endforeach
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    @endif
                                    <!-- //Modal -->
                                    <div class="mt-4 d-flex gap-2">
                                        @if (count(json_decode($product->colors)) > 0)
                                            <h4>
                                                <span class="h4" style="color: #000;">Colors</span>
                                            </h4>
                                            <div class="container">
                                                <div class="required">
                                                    <span class="product-options" id="input-option231">
                                                        @foreach (json_decode($product->colors) as $key => $color)
                                                            <label>
                                                                <input class="image_radio" type="radio" name="color"
                                                                    value="{{ $color }}" checked id=""
                                                                    title="{{ $color }}"
                                                                    style="background-color: <?= $color ?>">
                                                            </label>
                                                        @endforeach
                                                        </select>
                                                    </span>
                                                </div>
                                            </div>
                                        @endif
                                    </div>
                                    <div class="row">
                                        <div class="h4" id="chosen_price_div" hidden>
                                            {{ __('Total Price') }}: <strong id="chosen_price"></strong>
                                        </div>
                                    </div>

                                    <div class="mt-4 d-flex gap-2">
                                        <div class="wrapped-cartty">
                                            <div class="pull-left">
                                              <div class="custom pull-left">
                                                <button onclick="var result = document.getElementById('qty'); var qty = result.value; if( !isNaN( qty )) result.value++;return false;" class="increase items-count" type="button"><i class="fa fa-plus"></i></button>
                                                <input type="text" name="quantity" id="qty" maxlength="12" value="1" title="Quantity:" class="input-text qty">
                                                <button onclick="var result = document.getElementById('qty'); var qty = result.value; if( !isNaN( qty ) &amp;&amp; qty != 0 ) result.value--;return false;" class="reduced items-count" type="button"><i class="fa fa-minus"></i></button>
                                              </div>
                                              <!--custom pull-left-->
                                            </div>
                                        </div>
                                        <div>
                                            <input type="hidden" name="id" value="{{ $product->id }}">
                                            @if ($product->current_stock > 0)
                                                <button type="button" title="" onclick="addToCart();"
                                                    data-original-title="Add to Cart" class="btn add-to-cart"><span>Add to
                                                        Cart</span></button>
                                            @else
                                                <button type="button" title="" class="button btn-cart"><span>Out
                                                        Of Stock</span></button>
                                            @endif
                                            {{-- <a href="#" class="btn btn2 p2">ADD TO CART</a> --}}
                                        </div>
                                        @php 
                                            $uri = url()->current();
                                            $bodi = "body=I want to recommend this product at Scudin
                                            $product->title
                                            Learn more: $uri&subject=Check this deal out on Scudin";
                                        @endphp
                                        <a href="mailto:?{{ $bodi }}" title="Email to a Friend">
                                            <p class="text-center p-2 p3">                                            
                                                <i class="fa-solid fa-envelope"></i>
                                            </p>
                                        </a>
                                        <p class="text-center p-2 p3 pointer" onclick="addWishlist({{$product->id}})">
                                            <i class="fa-solid fa-heart"></i>
                                        </p>
                                    </div>
                                </div>

                                <div class="col-lg-6 col-sm-12 order-chart">
                                    @if (isset($product->chart_image))
                                        <h3 class="text-center">Size Chart</h3>
                                        <img src="{{ asset($product->chart_image) }}" alt=""
                                            class="img-fluid" />
                                    @endif
                                    <div class="mt-4">
                                        @php
                                         $qty = 0;
                                         if(!empty($product)){
                                            foreach (json_decode($product->variation) as $key => $variation) {
                                                $qty += $variation->qty;
                                            }
                                         }
                                        @endphp
                                        @if(isset($product->choice_options) && !empty($product->choice_options))
                                        @foreach (json_decode($product->choice_options) as $key => $choice)
                                        <div class="p-2">
                                            <span class="h4 mr-2">{{ $choice->title }}:</span>
                                            <div class="slider gap-2" style="display: -webkit-box;">
                                                @foreach ($choice->options as $key => $option)
                                                  <div class="bottom-border">
                                                      <input type="radio" class="radio_item" required id="{{ $choice->name }}-{{ $option }}" name="{{ $choice->name }}" value="{{ $option }}" @if($key==0) checked @endif>
                                                      <label class="label_item border"style="padding: 5px 10px;" for="{{ $choice->name }}-{{ $option }}"> {{ $option }} </label>
                                                  </div>
                                                @endforeach
                                            </div>
                                          </div>
                                        @endforeach
                                        @endif
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </form>
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
                                <div class="product-card bg-white border p-2" style="width: 220px">
                                    <a href="{{ route('product', $viewed->slug) }}" title="{{ $viewed->name }}"
                                        class="product-image">
                                        <img src="{{ asset($viewed->thumbnail) }}" alt="{{ $viewed->image }}" width="220px" />
                                    </a>

                                    <div class="body mx-auto" style="width: 150px">
                                        <a href="{{ route('product', $viewed->slug) }}" class="text-dark pb-2"
                                            title="{{ $viewed->name }}">
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
                                <div class="product-card bg-white border p-2" style="width: 220px">
                                    <a href="{{ route('product', $viewed->slug) }}" title="{{ $viewed->name }}"
                                        class="product-image">
                                        <img src="{{ asset($viewed->thumbnail) }}" alt="{{ $viewed->image }}" width="220px" />
                                    </a>

                                    <div class="body mx-auto" style="width: 150px">
                                        <a href="{{ route('product', $viewed->slug) }}" class="text-dark pb-2"
                                            title="{{ $viewed->name }}">
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

    <section class="product-details">
        <div class="container-fluid p-3">
            <ul class="nav nav-tabs gap-3 d-flex justify-content-center" id="myTab" role="tablist">
                <li class="nav-item" role="presentation">
                    <button class="nav-link btn active" id="home-tab" data-bs-toggle="tab"
                        data-bs-target="#home" type="button" role="tab" aria-controls="home"
                        aria-selected="true">Product Description</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link btn" id="profile-tab" data-bs-toggle="tab"
                        data-bs-target="#profile" type="button" role="tab" aria-controls="profile"
                        aria-selected="false">Reviews</button>
                </li>
                <li class="nav-item" role="presentation">
                    <a href="{{ route('shopView', [$product->seller->id]) }}">
                        <button class="nav-link btn" id="contact-tab" data-bs-toggle="tab"
                            data-bs-target="#contact" type="button" role="tab" aria-controls="contact"
                            aria-selected="false">Vendor Store</button>
                    </a>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link btn" id="more-tab" data-bs-toggle="tab" data-bs-target="#more"
                        type="button" role="tab" aria-controls="contact" aria-selected="false">More
                        Products</button>
                </li>
            </ul>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                    <?php
                    $data = json_decode($product->extra_data);
                    if (empty($product->extra_data) && strlen($product->extra_data) < 5 && empty($product->chart_image)) {
                        $col = 12;
                    } elseif (!empty($product->extra_data) && empty($product->chart_image) or empty($product->extra_data) && !empty($product->chart_image)) {
                        $col = 8;
                    } else {
                        $col = 4;
                    }
                    ?>
                    <div class="row g-2">
                        <div class="col-md-{{ $col }}">
                            <div class="add-features">
                                <p class="text-uppercase h2 border-bottom">product details</p>
                                <p class="mt-5">
                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                                    Eligendi magnam nulla itaque consequatur a vitae doloremque, nam
                                    magni dolore, accusamus similique neque. Aspernatur quae iusto
                                    nesciunt debitis non tempore optio facilis illo,
                                </p>
                            </div>
                        </div>

                        @if (isset($product->chart_image))
                            <div class="col-lg-4 col-sm-12">
                                <div class="add-features">
                                    <p class="text-uppercase h5 border-bottom">Size Chart & Additional Images</p>
                                    <p class="mt-5">
                                        <img src="{{ $product->chart_image }}" alt="">
                                    </p>
                                </div>
                            </div>
                        @endif

                        @if (!empty($product->extra_data) && strlen($product->extra_data) > 5)
                            <div class="col-lg-4 col-sm-12">
                                <div class="add-features">
                                    <p class="text-uppercase h5 border-bottom">Additional Product Features</p>
                                    <div class="p-3">
                                        @foreach ($data as $key => $value)
                                            <p style="margin-bottom: 1px">
                                                <span style="width: 40px">
                                                    {{ ucwords(str_replace('_', ' ', $key)) }}
                                                </span>
                                                <td>
                                                    : {!! $value !!}
                                                </td>
                                            </p>
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                        @endif
                    </div>
                </div>
                <div class="tab-pane fade bg-white p-3" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                    <h3>Customer Reviews</h3>
                    @forelse ($product->reviews as $key => $review)
                        <div class="bg-white p-3 container border-bottom">
                            <div class="row">
                                <div class="col-md-2">
                                    <img src="{{ asset($review->user->image) }}"
                                        class="img img-rounded img-fluid avatar" />
                                    <p class="text-secondary text-left">{{ show_datetime($review->created_at) }}</p>
                                </div>
                                <div class="col-md-9">
                                    <div class="d-flex justify-content-between">
                                        <a class="float-left" href="#!">
                                            <strong>{{ ucfirst($review->user->f_name) }}</strong>
                                        </a>
                                        @include('rating', ['r' => $review->rating * 20])
                                    </div>
                                    <div class="clearfix"></div>
                                    <p>{{ $review->comment }}</p>
                                </div>
                            </div>

                        </div>
                    @empty
                        <p class="text-center h2">No review found</p>
                    @endforelse

                </div>
                <div class="tab-pane fade bg-white p-3" id="contact" role="tabpanel" aria-labelledby="contact-tab">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="float-end">
                                    <img src="https://i.gifer.com/origin/b4/b4d657e7ef262b88eb5f7ac021edda87.gif"
                                        alt="Loading..." style="width:150px">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade bg-white p-3" id="more" role="tabpanel" aria-labelledby="more-tab">
                    <div class="row">
                        <div class="col-12">
                            <div class="slider d-flex gap-3 mb-2">
                                @foreach ($mproducts as $key => $viewed)
                                    @php($overallRating = get_overall_rating($viewed->reviews))
                                    <div class="product-card border p-2" style="width: 220px">
                                        <a href="{{ route('product', $viewed->slug) }}" title="{{ $viewed->name }}"
                                            class="product-image">
                                            <img src="{{ asset($viewed->thumbnail) }}" alt="..." width="220px" />
                                        </a>

                                        <div class="body mx-auto" style="width: 150px">
                                            <a href="{{ route('product', $viewed->slug) }}"
                                                class="text-dark pb-2 clipper" title="{{ $viewed->name }}">
                                                {{ $viewed->name }}
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
            </div>
        </div>
    </section>
@endsection

@push('js')
    <script src="{{ asset('new/slider.js') }}"></script>
    <script type="text/javascript">
        cartQuantityInitialize();
        getVariantPrice();
        $('#add-to-cart-form input').on('change', function() {
            getVariantPrice();
        });
    </script>
@endpush
