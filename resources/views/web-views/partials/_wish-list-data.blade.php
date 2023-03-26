<style>
  body {
    font-family: 'Titillium Web', sans-serif
  }

  .card {
    border: none
  }

  .totals tr td {
    font-size: 13px
  }

  .footer span {
    font-size: 12px
  }

  .product-qty span {
    font-size: 12px;
    color: #6A6A6A;
  }

  .font-name {
    font-weight: 600;
    font-size: 15px;
    color: #030303;
  }

  .sellerName {
    font-weight: 600;
    font-size: 14px;
    color: #030303;
  }

  .wishlist_product_img img {
    margin: 15px;
  }

  @media (max-width: 600px) {
    .font-name {
      font-size: 12px;
      font-weight: 400;
    }

    .amount {
      font-size: 12px;
    }
  }

  @media (max-width: 600px) {
    .wishlist_product_img {
      width: 20%;
    }

    .forPadding {
      padding: 6px;
    }

    .sellerName {

      font-weight: 400;
      font-size: 12px;
      color: #030303;
    }

    .wishlist_product_desc {
      width: 50%;
      margin-top: 0px !important;
    }

    .wishlist_product_icon {
      margin-left: 1px !important;
    }

    .wishlist_product_btn {
      width: 30%;
      margin-top: 10px !important;
    }

    .wishlist_product_img img {
      margin: 8px;
    }
  }
</style>
@if($wishlists->count()>0)

<div class="row">
  @foreach($wishlists as $wishlist)
  @php($product = $wishlist->product)
  <div class="product-card border m-1 bg-white" style="width: 220px">
    <a href="{{route('product', $product->slug)}}" title="{{ $product->name }}" class="product-image">
        <img src="{{ asset($product->thumbnail) }}" alt="..." width="200px" />
    </a>

    <div class="body mx-auto" style="width: 150px">
        <a href="{{route('product',$product->slug)}}" title="{{ $product->name }}" class="clipper">{{ $product->name }}</a>
        <div class="star d-flex">
          <a href="javascript:" onclick="removeWishlist('{{ $product->id }}')" class="btn btn-scudin"><i class="fa fa-trash"></i></a>
          <a href="{{route('product', $product->slug)}}" class="btn btn-scudin"><i class="fa fa-cart-plus"></i></a>
        </div>
        
        <p class="mt-2">{{ \App\CPU\Helpers::get_price_range($product) }}</p>
    </div>
</div>
  @endforeach
</div>
@else
<center>
  <h3 class="text-dark">
    No data found.
  </h3>
</center>
@endif
