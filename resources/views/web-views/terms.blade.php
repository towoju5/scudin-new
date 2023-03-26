@extends('layout.master')
@section("title", $title)

@section('content')

<section class="dashboard">
  <div class="container">
    <div class="row mt-5">
      <div class="col-lg-9">
        <h2>{{ $title }}</h2>
        <div class="bg-white p-3">
          {!! $terms_condition['value'] !!}
        </div>
      </div>

      <div class="col-lg-3 p-4">
        <div class="in-search">
          <form class="d-flex mb-3" role="search">
            <button class="btn" type="submit">
              <i class="fa-sharp fa-solid fa-magnifying-glass"></i>
            </button>
            <input class="form-control" type="search" placeholder="Search sellers near me" aria-label="Search" />
          </form>
          <div class="p-3">
            <h2 class="">Blog Segment</h2>
            <ul>
              <li>Retail</li>
              <li>Ecommerce</li>
              <li>Logistics</li>
              <li>Investor Relations</li>
              <li>Other Related Topics</li>
            </ul>
          </div>

          <div class="p-3">
            <h2 class="">Policy & Updates</h2>
            <ul>
              <li>
                <a href="{{ url('privacy-policy') }}">Privacy Policy</a>
              </li>
              <li>
                <a href="{{ url('terms') }}">
                  Terms and Conditions
                </a>
              </li>
              <li>Return Policy</li>
              <li>Consumer Right Protections</li>
            </ul>
          </div>

          <div class="p-3">
            <h2 class="fs-3">Document Updates</h2>
            <ul>
              <li>Developer</li>
              <li>API</li>
              <li>Related Documents</li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<section class="FAQ my-5">
  <h2 class="text-center">Frequently Asked Questions</h2>
  <!-- TO be done with quaery -->
</section>
@php($posts = App\BlogModel::orderBy('created_at', 'desc')->limit(12)->get())
<section class="blog">
  <h1 class="text-center">Blog and Insights on Supply Chain</h1>
  <div class="container">
    <div class="row my-5">
      @foreach($posts as $post)
      <div class="col-lg-4 col-sm-6 p-3">
        <div class="card">
          <div class="card-body">
            <h5 class="card-title">{{ $post->title }}</h5>
            <p class="card-text text-muted">
              {{ Str::limit($post->excerpt, 20) }}
            </p>
            <a href="{{route('blog.show', $post->slug)}}" class="card-link">Read more...</a>
            <div class="car-footer">
              <small href="#" class="text-muted">5 minute read</small>
            </div>
          </div>
        </div>
      </div>
      @endforeach
    </div>
  </div>
</section>
@endsection