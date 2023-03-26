@extends('layout.master')

@section('title', "Sell on Scudin")

@section('content')
@php $location = userLocation() @endphp
<section class="showcase">
    <div class="container-fluid">
      <div class="div1 p-2">
        <h2>Sell On Scudin</h2>
        <p>Your shopping location is:   {{ $location['cityName'] }}, {{ $location['regionName'] }}, {{ $location['countryName'] }} </p>
      </div>

      <div class="row">
        <div class="col-lg-6 col-s-12">
          <div class="showcase-text">
            <h2>
              Sell on Scudin with Proven Ecommerce Technologies. Reach
              Millions of Customers Worldwide.
            </h2>
            <a href="{{ url('shop/apply') }}">
                <button class="btn btn1 px-5 my-4">Get Started</button>
            </a>
          </div>
        </div>
        <div class="col-lg-6 col-s-12">
          <img src="./Asset/image 12.png" alt="" class="img-fluid mt-4" />
        </div>
      </div>
    </div>
  </section>

  <section class="product my-5">
    <div class="container">
      <div class="row">
        <div class="col-lg-6 col-sm-12">
          <div class="product-img mt-5">
            <img src="./Asset/Scudin-product.png" alt="" class="img-fluid" />
          </div>
        </div>
        <div class="col-lg-6 col-sm-12">
          <div class="product-text p-1">
            <h2>
              Drive Demands for Your Products Using Converging Technologies
              that Meet The Customer’s Needs.
            </h2>
          </div>
          <a href="{{ url('shop/apply') }}">
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
          <div class="card p-2" style="max-width: 24rem">
            <img
              src="./Asset/Rectangle 135.png"
              class="card-img-top"
              alt="..."
            />
            <div class="card-body">
              <h5 class="card-title">
                Reach Millions of People While Selling on Scudin
              </h5>
              <p class="card-text mt-3">
                Use the best advanced selling tools to get your products to
                millions of customers worldwide.
              </p>
            </div>
          </div>
        </div>

        <div class="col-lg-4 col-md-6 col-sm-12">
          <div class="card p-2" style="max-width: 24rem">
            <img
              src="./Asset/Rectangle 138.png"
              class="card-img-top"
              alt="..."
            />
            <div class="card-body">
              <h5 class="card-title">
                Drive Demands, Sell More, and Fulfill Faster
              </h5>
              <p class="card-text mt-3">
                You will have the option to grow your business with fulfilment
                by Scudin Ethos to deliver orders faster.
              </p>
            </div>
          </div>
        </div>

        <div class="col-lg-4 col-md-6 col-sm-12">
          <div class="card p-2" style="max-width: 24rem">
            <img
              src="./Asset/Rectangle 147.png"
              class="card-img-top"
              alt="..."
            />
            <div class="card-body">
              <h5 class="card-title">
                Scale Your Profit Margin and Gain Economic Power
              </h5>
              <p class="card-text mt-3">
                YExperience increase in selling efficiency with API
                integration and make <br />
                economic gain.
              </p>
            </div>
          </div>
        </div>

        <div class="col-lg-4 col-md-6 col-sm-12">
          <div class="card p-2" style="max-width: 24rem">
            <img
              src="./Asset/Rectangle 144.png"
              class="card-img-top"
              alt="..."
            />
            <div class="card-body">
              <h5 class="card-title">
                Promote Products Online Reach More Audience
              </h5>
              <p class="card-text mt-3">
                Increase your sales by promoting your products and getting
                them in front of the right audience.
              </p>
            </div>
          </div>
        </div>

        <div class="col-lg-4 col-md-6 col-sm-12">
          <div class="card p-2" style="max-width: 24rem">
            <img
              src="./Asset/Rectangle 145.png"
              class="card-img-top"
              alt="..."
            />
            <div class="card-body">
              <h5 class="card-title">
                Opt in for Storage, Save Space, and Ship Orders Faster
              </h5>
              <p class="card-text mt-3">
                You will have the options to utilize Scudin storage services
                that help you get organize and ship faster.
              </p>
            </div>
          </div>
        </div>

        <div class="col-lg-4 col-md-6 col-sm-12">
          <div class="card p-2" style="max-width: 24rem">
            <img
              src="./Asset/Rectangle 146.png"
              class="card-img-top"
              alt="..."
            />
            <div class="card-body">
              <h5 class="card-title">Receive World class Service Support</h5>
              <p class="card-text mt-3">
                Get 24/7 customer service and experience one of the best
                customer-centric support that makes you feel valued.
              </p>
            </div>
          </div>
        </div>
      </div>
      <div class="sell-button my-3">
        <a href="{{ url('shop/apply') }}">
            <button class="btn btn1 px-5 my-4 mx-auto">Sell On Scudin</button>
        </a>
      </div>
    </div>
  </section>

  <section class="plan p-1">
    <div class="container mt-5">
      <h1 class="text-center">How to Sell on Scudin</h1>
      <div class="row my-5 g-5">
        <div class="col-lg-4 col-sm-12">
          <div class="card ms-lg-auto" style="width: 20rem">
            <div class="card-header">
              <h4>Sell with Basic Plan</h4>
            </div>
            <ul class="list-group-flush p-4">
              <li class="list-group-item mt-3">
                $0.00 / (always), a monthly free plan to get started
              </li>

              <li class="list-group-item my-5">Unlimited Products / Month</li>
              <li class="list-group-item mb-5">
                For 35 or more units of items sold + additional selling fees
              </li>
            </ul>
            <a href="{{ url('shop/apply') }}">
                <button class="btn btn1 px-5 m-4">Sell On Scudin</button>
            </a>
          </div>
        </div>

        <div class="col-lg-4 col-sm-12">
          <div class="card mx-lg-auto" style="max-width: 20rem">
            <div class="card-header">
              <h4>Sell with Business Plan</h4>
            </div>
            <ul class="list-group-flush p-4">
              <li class="list-group-item mt-3">
                $29.99 / Month <br />
                <span>(Recommended)</span>
              </li>

              <li class="list-group-item my-5">Unlimited Products / Month</li>
              <li class="list-group-item mb-5">
                For 35 or more units of items sold + additional selling fees
              </li>
            </ul>
            <a href="{{ url('shop/apply') }}">
                <button class="btn btn1 px-5 m-4">Sell On Scudin</button>
            </a>
          </div>
        </div>

        <div class="col-lg-4 col-sm-12">
          <div class="card me-lg-auto" style="width: 20rem">
            <div class="card-header">
              <h4>Sell with Ethos Premium</h4>
            </div>
            <ul class="list-group-flush p-4">
              <li class="list-group-item mt-3">
                $4,599.99 / Month <br />
                (for Enterprise)
              </li>

              <li class="list-group-item my-5">Unlimited Products / Month</li>
              <li class="list-group-item">
                We will handle all the shipping and returns for items weighing
                20lbs (9.07kg) or less, while you focus on managing your
                business.
              </li>
            </ul>
            <a href="{{ url('shop/apply') }}">
                <button class="btn btn1 px-5 m-4">Sell On Scudin</button>
            </a>
          </div>
        </div>
      </div>
    </div>
  </section>
@endsection

@push('js')
<script>
    $(document).ready(function(){
        $('.card .card-body').matchHeight();
    })
</script>
@endpush