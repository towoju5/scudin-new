@extends('layout.master')

@section('title', 'Blog articles')

@php $location = userLocation() @endphp
@section('content')
    <div class="text-end p-2">
        <div class="container">
            Your shopping location is: {{ $location['cityName'] }}, {{ $location['regionName'] }},
            {{ $location['countryName'] }}</p>
        </div>
    </div>

    <section class="showcase2 p-1" style="background-image: url({{ asset('asset/Rectangle\ 89.png') }});">
        <div class="container">
            <div class="showcase2-tex my-5">
                <h3 style="font-size: 48px;">Sell on Scudin with Proven<br> Ecommerce Technologies.<br> Reach Millions of customers <br>Worldwide.</h3>
                <button class="btn btn-scudin px-5 my-4">Start Selling</button>
            </div>
        </div>
    </section>

    <section class="blog">
        <div class="container">
            <div class="row my-5">
                <div class="col-lg-9">
                    <div class="row">
                        @foreach ($articles->take(2) as $article)
                            <div class="col-md-6 col-sm-12">
                                <div class="card">
                                    <a href="{{ route('blog.show', $article->slug) }}" title="{{ $article->title }}">
                                        <img src="{{ $article->blog_image }}" class="card-img-top" alt="..."
                                            style="height: 14rem" />
                                    </a>
                                    <div class="card-body">
                                        <h5 class="card-title">
                                            <a href="{{ route('blog.show', $article->slug) }}" class="garage-title h3"
                                                title="{{ $article->title }}">
                                                {{ $article->title }}
                                            </a>
                                        </h5>
                                        <p class="card-text text-muted">
                                            {!! ucwords(reading_time($article->body)) !!}
                                        </p>
                                        <a href="#" class="btn btn-scudin">Read</a>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div>

                    <div class="blog-details mt-5">
                        <h3 class="border-bottom mb-2">{{ $post->title }}</h3>
                        <div class="content p-4">
                            {!! $post->body !!}
                        </div>
                    </div>
                </div>

                <div class="col-lg-3 col-sm-12">
                    <div class="in-search">
                        <form class="d-flex mb-3" role="search">
                            <button class="btn" type="submit">
                                <i class="fa-sharp fa-solid fa-magnifying-glass"></i>
                            </button>
                            <input class="form-control" type="search" placeholder="Search sellers near me"
                                aria-label="Search" />
                        </form>
                        <div class="container">
                            <h2 class="card-title border-bottom pb-1">Blog Segment</h2>
                            <ul class="pt-2">
                                <li><a href="{{ url('blog/index?category=retail') }}">Retail</a></li>
                                <li class="my-2"><a href="{{ url('blog/index?category=ecommerce') }}">Ecommerce</li>
                                <li><a href="{{ url('blog/index?category=logistics') }}">Logistics</li>
                                <li class="my-2"><a href="{{ url('blog/index?category=investor') }}">Investor Relations</li>
                                <li><a href="{{ url('blog/index?category=others') }}">Other Related Topics</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="my-5">
                <h3>Related Blog and Insights on Supply Chain</h3>
                <div class="row">
                    @foreach ($articles->skip(2)->take(4) as $article)
                        <div class="col-lg-3 col-sm-6">
                            <div class="card">
                                <a href="{{ route('blog.show', $article->slug) }}" title="{{ $article->title }}">
                                    <img src="{{ $article->blog_image }}" class="card-img-top" alt="{{ $article->title }}"
                                        style="height: 10rem" />
                                </a>
                                <div class="card-body">
                                    <p class="card-title">{{ $article->title }}</p>
                                    <p class="card-text text-muted">
                                        {{ $article->excerpt }}
                                    </p>
                                    <a href="{{ route('blog.show', $article->slug) }}" title="{{ $article->title }}">
                                        <small>
                                            {!! ucwords(reading_time($article->body)) !!}
                                        </small>
                                    </a>
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
        </div>
    </section>

<section class="blog-trending my-5">
        <div class="container">
            <div class="row">
            @foreach($articles->skip(3)->take(1) as $article)
                <div class="col-lg-4">
                    <div class="card-body">
                        <h2 class="card-title">
                            {{ $article->title}}
                        </h2>
                        <p class="card-text text-muted">
                            {{ $article->excerpt }}
                        </p>
                        <a href="{{route('blog.show', $article->slug)}}" class="btn">{!! ucwords(reading_time($article->body)) !!}</a>
                    </div>
                </div>

                <div class="col-lg-8">
                    <img src="{{ $article->blog_image }}" alt="" class="img-fluid" style="width: 100%; height: 300px" />
                </div>
            @endforeach
            </div>
        </div>
    </section>

    <section class="mapping p-5" style="background-image: url({{ asset('asset/PHOTO-2023-01-04-10-10-11\ 2.jpg') }})">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-sm-12">
                    <h3>
                        We Simplify The Complexity in The Ecommerce Services with The Best
                        Technology Solutions. We Drive Innovations by Helping Our Sellers
                        Reach Millions of Customers Worldwide.
                    </h3>
                    <button class="btn btn-scudin px-5 my-4">
                        Get Started by Signing Up Today
                    </button>
                </div>
                <div class="col-lg-6 col-sm-12">
                    <h4 class="" style="width: 60%">
                        Start Selling. Let Your Products Reach Across The World!
                    </h4>
                </div>
            </div>
        </div>
    </section>
@endsection

@push('js')
    <script>
        $(document).ready(function() {
            $('.card .card-body .card-title').matchHeight();
        })
    </script>
@endpush
