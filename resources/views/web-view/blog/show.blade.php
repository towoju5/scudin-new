@extends('layout.master')

@section('title','About Us')

@push('css_or_js')
<style>
  .headerTitle {
    font-size: 25px;
    font-weight: 700;
    margin-top: 2rem;
  }

  .for-container {
    width: 91%;
    border: 1px solid #D8D8D8;
    margin-top: 3%;
    margin-bottom: 3%;
  }

  .for-padding {
    padding: 3%;
  }
</style>

<meta property="og:image" content="{{asset('storage/app/public/company')}}/{{$web_config['web_logo']->value}}" />
<meta property="og:title" content="About {{$web_config['name']->value}} " />
<meta property="og:url" content="{{env('APP_URL')}}">
<meta property="og:description" content="{!! substr($web_config['about']->value,0,100) !!}">

<meta property="twitter:card" content="{{asset('storage/app/public/company')}}/{{$web_config['web_logo']->value}}" />
<meta property="twitter:title" content="about {{$web_config['name']->value}}" />
<meta property="twitter:url" content="{{env('APP_URL')}}">
<meta property="twitter:description" content="{!! substr($web_config['about']->value,0,100) !!}">
@endpush

@section('content')
<div class="container for-container">
  <h2 class="text-center mt-3 headerTitle h3">{{ $post->title }}</h2>
  <div class="for-padding">
    <div class="panel">
      <div class="panel-body">
        @if(!empty($post->image))
        <div class="text-center">
          <img src="{{ $post->blog_image }}" alt="{{ $post->title }}">
        </div>
        @endif
        <div class="panel-body">
          <div class="text-center">
            <img src="{{ asset($post->blog_image) }}" style="max-width: 300px; max-height:fit-content" alt="">
          </div>
          {!! $post->body !!}
        </div>
      </div>
    </div>
  </div>
</div>
@endsection