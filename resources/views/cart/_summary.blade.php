<?php
$sub_total = 0;
$total_tax = 0;
$total_shipping_cost = 0;
$total_discount_on_product = 0;
$_msg = "";
$total_shipping_cost = 0;

if (session()->has('cart') && count(session()->get('cart')) > 0) :
    foreach (session('cart') as $key => $carty) :
        $cartItem = to_array($carty);
        //var_dump((session('cart')['shipping_cost'])->sum('cost')); exit;
        $sub_total += floatval($cartItem['price']) * $cartItem['quantity'];
        $total_tax += floatval($cartItem['tax']) * $cartItem['quantity'];
        $total_discount_on_product += floatval($cartItem['discount']) * $cartItem['quantity'];
    endforeach;
else :
    $_msg = "<span>Empty Cart</span>";
endif
?>

<div class="card" id="cart-summary">
    <div class="card-header">
        <h2>Shopping Cart</h2>
    </div>
    <div class="card-body">
        <form action="#" method="post">
            <input name="form_key" type="hidden" value="EPYwQxF6xoWcjLUr">
            <fieldset class="container-fluid table-responsive">
                <table id="shopping-cart-table" class="table data-table cart-table table-striped">
                    <thead>
                        <tr class="first last">
                            <th rowspan="1">Product Image</th>
                            <th rowspan="1"><span class="nobr">Product Name</span></th>
                            <th class="a-center" colspan="1"><span class="nobr">Unit Price</span></th>
                            <th rowspan="1" class="a-center">Qty</th>
                            <th class="a-center" colspan="1">Subtotal</th>
                            <th rowspan="1" class="a-center">&nbsp;</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr class="first last">
                            <td colspan="6" class="last">
                                <a href="{{route('home')}}">
                                    <button type="button" title="Continue Shopping" class="btn btn-scudin">
                                        Continue Shopping
                                    </button>
                                </a>
                            </td>
                        </tr>
                    </tfoot>
                    <tbody>
                        @foreach(session()->get('cart') as $key => $cartItem)
                        <tr class="first last odd">
                            <td class="image hidden-table">
                                <a href="{{route('product',$cartItem['slug'])}}" title="{{ $cartItem['name'] }}" class="product-image">
                                    <img src='{{asset("$cartItem[thumbnail]")}}' width="75" alt="{{ $cartItem['name'] }}">
                                </a>
                            </td>
                            <td class="fixed">
                                <h5 class="product-name">
                                    <a href="{{route('product',$cartItem['slug'])}}">{{ $cartItem['name'] }}</a>
                                </h5>
                                <br>
                                @foreach($cartItem['variations'] as $k => $variation)
                                <div class="text-muted">
                                    <span class="mr-2">{{ ucfirst($k) }} :</span>{{ $variation }}
                                </div>
                                @endforeach
                            </td>
                            <td class="hidden-table">
                                <span class="cart-price">
                                    <span class="price">{{ \App\CPU\Helpers::currency_converter($cartItem['price']-$cartItem['discount']) }}</span>
                                </span>
                            </td>
                            <td class="a-center movewishlist">
                                <select class="form-control" name="quantity[{{ $key }}]" id="cartQuantity{{$key}}" onchange="updateCartQuantity('{{$key}}');" style="min-width: 4rem;">
                                    @for ($i = 1; $i <= 100; $i++) <option value="{{$i}}" <?php if ($cartItem['quantity'] == $i) echo "selected" ?>> {{ $i }} </option>
                                        @endfor
                                </select>
                            </td>
                            <td class="movewishlist">
                                <span class="cart-price">
                                    <span class="price">{{ \App\CPU\Helpers::currency_converter(($cartItem['price']  -$cartItem['discount']) * $cartItem['quantity']) }}</span>
                                </span>
                            </td>
                            <td class="a-center last">
                                <a href="#" title="Remove item" class="button remove-item" onclick="removeFromCart('{{ $key }}')">
                                    <span>Remove item</span>
                                </a>
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </fieldset>
        </form>
    </div>
    <!-- BEGIN CART COLLATERALS -->
    <div class="container-fluid mt-5">
        <div class="row p-4">                
            <!-- col-sm-4-->
            <div class="col-sm-6">
                <div class="discount">
                    <h3 class="border-bottom">Discount Codes</h3>
                    <form id="coupon-code-ajax" action="#" method="post">
                        <label for="coupon_code">Enter your coupon code if you have one.</label>
                        <input type="hidden" name="remove" id="remove-coupone" value="0">
                        <input class="form-control form-control-lg" type="text" id="coupon_code" name="code" value="{{ old('code') }}">
                        <div class="form-group mt-3">
                            <button type="button" title="Apply Coupon" class="btn btn-scudin " onclick="couponCode()" value="Apply Coupon"><span>Apply Coupon</span></button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="totals">
                    <h3>Shopping Cart Total</h3>
                <div class="alert alert-danger">
                    <p class="text-center h4">Shipping Fee will be calculated on the next page.</p>
                </div>
                    <div class="inner">
                        <table id="shopping-cart-totals-table" class="table shopping-cart-table-total">
                            <tbody>
                                <tr>
                                    <td class="a-left" colspan="1"> Subtotal </td>
                                    <td class="a-right">
                                        <span class="price">{{\App\CPU\Helpers::currency_converter($sub_total)}}</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="a-left" colspan="1"> Tax </td>
                                    <td class="a-right">
                                        <span class="price">{{\App\CPU\Helpers::currency_converter($total_tax)}}</span>
                                    </td>
                                </tr>
                                <?php /*
                                <tr>
                                    <td class="a-left" colspan="1"> Shipping Fee </td>
                                    <td class="a-right">
                                        <span class="price">{{\App\CPU\Helpers::currency_converter($total_shipping_cost)}}</span>
                                    </td>
                                </tr> */ ?>
                                @if(session()->has('coupon_discount'))
                                <tr>
                                    <td class="a-left" colspan="1"> Discount on Product </td>
                                    <td class="a-right">
                                        <span class="price"> - {{ ($coupon_dis = session()->has('coupon_discount')) ?\App\CPU\Helpers::currency_converter(session('coupon_discount')):0}} </span>
                                    </td>
                                </tr>
                                @else
                                <tr>
                                    <td class="a-left" colspan="1"> Discount on Product </td>
                                    <td class="a-right">
                                        <span class="price"> - {{\App\CPU\Helpers::currency_converter($total_discount_on_product)}}</span>
                                    </td>
                                </tr>
                                @php($coupon_dis=0)
                                @endif
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td class="a-left" colspan="1">
                                        <strong>Grand Total</strong>
                                    </td>
                                    <td class="a-right">
                                        <strong><span class="price">{{\App\CPU\Helpers::currency_converter($sub_total+$total_tax+$total_shipping_cost-$coupon_dis-$total_discount_on_product)}}</span></strong>
                                    </td>
                                </tr>
                            </tfoot>
                        </table>
                        <ul class="checkout">
                            <li>
                                <button type="button" title="Proceed to Checkout" class="btn btn-scudin" onClick="location.href='<?= route('checkout-details') ?>?type=checkout'"><span>Proceed to Checkout</span></button>
                            </li>
                        </ul>
                    </div>
                    <!--inner-->
                </div>
                <!--totals-->
            </div>
            <!--col-sm-4-->
        </div>
    </div>
    <!--cart-collaterals-->
</div>
<!--cart-->



@push('css')
<style>
    .fixed {
        table-layout: fixed;
        width: 400px;
    }
</style>
@endpush

@push('js')
<script>
    function set_shipping_id(id) {
        $.ajax({
            url: "{{ url('customer/set-shipping-method') }}",
            dataType: 'json',
            type: 'get',
            data: {
                id: id,
                _token: "{{ csrf_token() }}"
            },
            beforeSend: function() {
                $('#loading').show();
            },
            success: function(data) {
                if (data.status == 1) {
                    toastr.success('Shipping method selected', {
                        CloseButton: true,
                        ProgressBar: true
                    });
                    setInterval(function() {
                        location.reload();
                    }, 2000);
                } else {
                    toastr.error('Choose proper shipping method.', {
                        CloseButton: true,
                        ProgressBar: true
                    });
                }
            },
            complete: function() {
                $('#loading').hide();
            },
        });
    }
</script>
@endpush