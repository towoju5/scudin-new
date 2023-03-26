<?php $mWidth = "200px"; $imgWidth = "180px";
  if((new \Jenssegers\Agent\Agent())->isMobile()){
    $mWidth = "175px";
    $imgWidth = "160px";
  }
?>
<div class="row" style="pl-1">
  @foreach ($products as $product)
  @php($overallRating = \App\CPU\ProductManager::get_overall_rating($product->reviews))
  <div class="product-card bg-white border p-1" style="width: {{$mWidth}}">
      <a href="{{route('product',$product->slug)}}" title="{{ $product->name }}" class="product-image text-center">
          <img src="{{ asset($product->thumbnail) }}" alt="..." width="{{$imgWidth}}" />
      </a>

      <div class="body mx-auto" style="width: 150px">
          <a href="{{route('product',$product->slug)}}" title="{{ $product->name }}" class="clipper">{{ $product->name }}</a>
          <div class="star d-flex">
            @include('rating', ['r' => $overallRating[0] * 20])
          </div>
          <p class="mt-2">{{ \App\CPU\Helpers::get_price_range($product) }}</p>
      </div>
  </div>
  @endforeach
</div>

<div class="toolbar float-right">
  <div class="pager">
    <div class="pages" id="ajax-products">
      {!! $products->render('pagination') !!}
    </div>
  </div>
</div>