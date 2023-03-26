@extends('layout.master')

@section('title', "About Us")

@section('content')

@php $location = userLocation() @endphp
<section class="showcase">
    <div class="container">
      <div class="div1 p-2">
        <h2>Want To Know About Scudin?</h2>
        <p>Your shopping location is: {{ $location['cityName'] }}, {{ $location['regionName'] }}, {{ $location['countryName'] }}</p>
      </div>

      <div class="row">
        <div class="col-lg-6 col-s-12">
          <div class="showcase-text">
            <h2>
              We are Democratizing Ecommerce Technologies for Everyone in The
              Community, Creating Economic Values
            </h2>
            <button class="btn btn1 px-5 my-4">Find Out More</button>
          </div>
        </div>
        <div class="col-lg-6 col-s-12">
          <img src="{{ asset('asset/image 12.png') }}" alt="" class="img-fluid mt-4" />
        </div>
      </div>
    </div>
  </section>

  <section class="product my-5">
    <div class="container">
      <div class="row">
        <div class="col-lg-6 col-sm-12">
          <div class="product-img mt-5">
            <img src="{{ asset('asset/Scudin-product.png') }}" alt="" class="img-fluid" />
          </div>
        </div>
        <div class="col-lg-6 col-sm-12">
          <div class="product-text p-1">
            <h2>
              Drive Demands for Your Products Using Converging Technologies
              that Meet The Customer’s Needs.
            </h2>
          </div>
          <a href="{{ url('customer/auth/login') }}">
            <button class="btn btn1 px-5 my-4">Start Here. Sign Up</button>
          </a>
        </div>
      </div>
    </div>
  </section>

  <section class="sell p-1">
    <div class="container mt-5">
      <h1 class="text-center mb-4">Why You Should Sell on Scudin</h1>
      <div class="row g-5">
        <div class="col-lg-4 col-md-6 col-sm-12">
          <div class="card p-2" style="width: 24rem">
            <img
              src="{{ asset('asset/Rectangle 138.png') }}"
              class="card-img-top"
              alt="..."
            />
            <div class="card-body">
              <h5 class="card-title">
                360 degree supply chain solutions, material handling and
                operations.
              </h5>
              <a href="{{ url('shop/apply') }}" class="text-dark">
                Sign Up to Become a Vendor
              </a>
            </div>
          </div>
        </div>

        <div class="col-lg-4 col-md-6 col-sm-12">
          <div class="card p-2" style="width: 24rem">
            <img
              src="{{ asset('asset/Rectangle 94.png') }}"
              class="card-img-top"
              alt="..."
            />
            <div class="card-body">
              <h5 class="card-title fs-5">
                Online retail space and store management capabilities that
                helps you deliver values to customers.
              </h5>
              <a href="{{ url('shop/apply') }}" class="text-dark">
                Sign Up to Become a Vendor
              </a>
            </div>
          </div>
        </div>

        <div class="col-lg-4 col-md-6 col-sm-12">
          <div class="card p-2" style="width: 24rem">
            <img
              src="{{ asset('asset/Rectangle 147.png') }}"
              class="card-img-top"
              alt="..."
            />
            <div class="card-body">
              <h5 class="card-title">
                Retail solutions, including online shopping for products and
                services.
              </h5>
              <a href="{{ url('shop/apply') }}" class="text-dark">
                Sign Up to Become a Vendor
              </a>
            </div>
          </div>
        </div>

        <div class="col-lg-4 col-md-6 col-sm-12">
          <div class="card p-2" style="width: 24rem">
            <img
              src="{{ asset('asset/Rectangle 145.png') }}"
              class="card-img-top"
              alt="..."
            />
            <div class="card-body">
              <h5 class="card-title">
                Internet and logistics, ecommerce and technology solutions.
              </h5>
              <a href="{{ url('shop/apply') }}" class="text-dark">
                Sign Up to Become a Vendor
              </a>
            </div>
          </div>
        </div>

        <div class="col-lg-4 col-md-6 col-sm-12">
          <div class="card p-2" style="width: 24rem">
            <img
              src="{{ asset('asset/Rectangle 144.png') }}"
              class="card-img-top"
              alt="..."
            />
            <div class="card-body">
              <h5 class="card-title">
                Online marketing and advertizing solutions that drives sales
                faster.
              </h5>
              <a href="{{ url('shop/apply') }}" class="text-dark">
                Sign Up to Become a Vendor
              </a>
            </div>
          </div>
        </div>

        <div class="col-lg-4 col-md-6 col-sm-12">
          <div class="card p-2" style="width: 24rem">
            <img
              src="{{ asset('asset/Rectangle 146.png') }}"
              class="card-img-top"
              alt="..."
            />
            <div class="card-body">
              <h5 class="card-title">
                Storage solutions, cloud computing, and software solutions and
              </h5>
              <a href="{{ url('shop/apply') }}" class="text-dark">
                Sign Up to Become a Vendor
              </a>
            </div>
          </div>
        </div>
      </div>
      <div class="sell-button my-3">
        <a href="{{ url('shop/apply') }}" class="text-dark">
            <button class="btn btn1 px-5 my-4 mx-auto">Sell On Scudin</button>
        </a>
      </div>
    </div>
  </section>
  @php($articles = App\BlogModel::take(12)->get())

  <section class="blog">
    <h1 class="text-center">Blog and Insights</h1>
    <div class="container">
      <div class="row my-5">
        @foreach($articles as $key => $blog)
        <div class="col-lg-4 col-sm-6 p-3">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title self_height">{{ $blog->title }}</h5>
              <p class="card-text text-muted clipper">
                <?php //Str::limit($blog->body, 80) ?>
              </p>
              <a href="{{ route('blog.show', $blog->slug) }}" class="card-link">Read more...</a>
              <div class="car-footer">
                <small class="text-muted">{!! ucwords(reading_time($blog->body)) !!}</small>
              </div>
            </div>
          </div>
        </div>
        @endforeach
      </div>
    </div>
  </section>

  <section class="mapping" style="background: url({{ asset('asset/PHOTO-2023-01-04-10-10-11\ 2.jpg') }})">
    <div class="container-fluid">
      <div class="row p-5">
        <div class="col-lg-6 col-sm-12">
          <h3 class="" style="width: 70%">
            We Simplify The Complexity in The Ecommerce Services with The Best
            Technology Solutions. We Drive Innovations by Helping Our Sellers
            Reach Millions of Customers Worldwide.
          </h3>
          <button class="btn btn1 px-5 my-4">
            Get Started by Signing Up Today
          </button>
        </div>
        <div class="col-lg-6 col-sm-12">
          <h4 class="" style="width: 40%">
            <h4 class="" style="width: 40%">
                Start Selling. Let Your Products Reach Across The World!
            </h4>
          </h4>
        </div>
      </div>
    </div>
  </section>
  
@endsection
@push('js')
<script>
    $(document).ready(function(){
        $('.self_height').matchHeight();
        $('.card .card-body').matchHeight();
        $('.card').matchHeight();
    })
</script>
@endpush