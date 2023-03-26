@extends('layout.master')
@section('title', 'Scudin Homepage')

@section('content')
<style>
    body {
        background: #FAFBFC;
    }
    .img-fluid {
        max-width: 100%;
        height: 150px;
    }
    .product-card {
        width: 220px;
    }
    .col-md-3 {
        width: 24.5%!important;
    }
    /* media query */
    @media screen and (max-width: 800px) {
        .col-md-3 {
          width: 100%!important;
        }
        
        .product-card {
            width: 45.5%;
        }
    }
</style>
    @php($main_banner = \App\Model\Banner::where('banner_type', 'Main Banner')->where('published', 1)->orderBy('id', 'desc')->get())
    <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
          @foreach ($main_banner as $key => $banner)
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="{{$key}}" class="active"
                aria-current="true" aria-label="Slide {{$key+1}}">
            </button>
          @endforeach
        </div>
        <div class="carousel-inner">
            @foreach ($main_banner->take(4) as $key => $banner)
                <div class="carousel-item  @if ($key == 0) active @endif">
                    <img src="{{ $banner->photo }}" class="d-block w-100" alt="..." style="/* height: 60vh */">
                    <div class="carousel-caption d-none d-md-block">
                        {{-- <h5>First slide label</h5> --}}
                        <p>{!! $banner->url !!}</p>
                    </div>
                </div>
            @endforeach
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>

    {{-- include slider --}}
    

    {{-- include category row --}}
    <section class="category mt-1">
        <div class="container-fluid">
            <div class="row m-2 gap-2">
                @foreach ($cat_based as $k => $cats)
                    @if (count($cats->products) > 2 && count($cats->products) > 0)
                        <div class="col-12 col-md-3 mt-3 bg-white p-3">
                            {{-- category title --}}
                            <h5 class="clipper">{{ $cats->name }}</h5>
                            {{-- // sub categories --}}
                            <div class="row d-flex align-items-center justify-content-center">
                                @foreach ($cats->products->take(4) as $cat)
                                    @if ($cat->count() != null)
                                        <div class="col-6">
                                            <a href="{{ route('products', ['id' => $cat->id, 'data_from' => 'category', 'page' => 1]) }}"
                                                title="{{ $cat->name }}" target="_self">
                                                <img src="{{ asset($cat->icon) }}" alt="" class="img-fluid" style="width: 100%">
                                                <p class="pt-2 text-dark clipper" title="{{ $cat->name }}">
                                                    {{ $cat->name }}
                                                </p>
                                            </a>
                                        </div>
                                    @endif
                                @endforeach
                            </div>
                        </div>
                    @endif
                @endforeach
            </div>

            <section class="related-product my-5">
                <div class="container-fluid">
                    <h4 class="my-5">Related Products</h4>
                    <div class="row">
                        @foreach ($featured_products->take(6) as $key => $viewed)
                            <!-- <div class="col-md-3 four-by-two"> -->
                                <div class="product-card m-1 bg-white">
                                    <a href="{{ route('product', $viewed->slug) }}" title="{{ $viewed->name }}"
                                        class="product-image">
                                        <img src="{{ asset($viewed->thumbnail) }}" alt="{{ $viewed->name }}"
                                            width="200px">
                                    </a>
                                    <div class="body mx-auto text-left p-2">
                                        <a href="{{ route('product', $viewed->slug) }}" title="{{ $viewed->name }}"
                                            class="product-image clipper">
                                            {{ ltrim($viewed->name) }}
                                        </a>
                                        <div class="star d-flex mt-3">
                                            <i class="fa-solid fa-star star"></i>
                                            <i class="fa-solid fa-star star"></i>
                                            <i class="fa-solid fa-star star"></i>
                                            <i class="fa-solid fa-star star"></i>
                                            <i class="fa-solid fa-star"></i>
                                        </div>
                                        <p class="mt-3">
                                            {{ \App\CPU\Helpers::currency_converter($viewed->unit_price - \App\CPU\Helpers::get_product_discount($viewed, $viewed->unit_price)) }}
                                        </p>
                                    </div>
                                </div>
                            <!-- </div> -->
                        @endforeach
                    </div>
                </div>
            </section>

            <div class="row m-2 gap-2">
                @foreach ($cat_based1 as $k => $pp)
                    @if (count($pp->products) > 2 && count($pp->products) > 0)
                        <div class="col-12 col-md-3 mt-3 by4 bg-white p-3">
                            {{-- category title --}}
                            <h5 class="clipper">{{ $pp->name }}</h5>
                            {{-- // sub categories --}}
                            <div class="row d-flex align-items-center justify-content-center">
                                @foreach ($pp->products->take(4) as $cat)
                                    @if ($cat->count() != null)
                                        <div class="col-6">
                                            <a href="{{ route('products', ['id' => $cat->id, 'data_from' => 'category', 'page' => 1]) }}"
                                                title="{{ $cat->name }}" target="_self">
                                                <img src="{{ asset($cat->icon) }}" alt="" class="img-fluid" />
                                                <p class="pt-2 text-dark clipper" title="{{ $cat->name }}">
                                                    {{ $cat->name }}
                                                </p>
                                            </a>
                                        </div>
                                    @endif
                                @endforeach
                            </div>
                        </div>
                    @endif
                @endforeach
            </div>
        </div>

    </section>

@endsection