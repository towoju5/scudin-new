<?php
use App\User;


$coupon_discount = session()->has('coupon_discount') ? session('coupon_discount') : 0;
$value = \App\CPU\CartManager::cart_grand_total(session('cart')) - $coupon_discount;

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
endif;    

if (auth('customer')->check()) {
    $shipping_address = \App\Model\ShippingAddress::where('customer_id', auth('customer')->id())->first();
    if (empty($shipping_address)) {
        echo "<script>$('#shippingAddressModal').modal('show')</script>";
    } else {
        session()->put('customer_info', [
            'address_id' => $shipping_address->id
        ]);
    }
} else {
    toastr()->error("Please login to continue");
    header("Location: " . url('cart/show'));
    exit;
};
?>
@extends('layout.master')
@section('title', 'Checkout')

@push('css')
    <style>
        .radio_item {
            display: none !important;
        }

        .label_item {
            opacity: 0.1;
        }

        .radio_item:checked+label {
            opacity: 1;
        }

        label {
            cursor: pointer;
        }

        .switchy.active {
            padding-bottom: 10px;
            border-bottom: 2px solid #000;
        }
    </style>
@endpush

@section('content')
    <section class="checkout">
        <div class="container">
            <h2 class="my-5">Checkout</h2>
            <?php $payId = $payment_intent; ?>
            <div class="row g-3 my-5">
                <div class="col-lg-6 col-sm-12">
                    <div class="shipping">
                        @if(!empty($shipping_address))
                        <div class="d-flex">
                            <h3>Shipping</h3>
                            <p onclick="$('#editAddress_{{$shipping_address->id}}').modal('show')" style="cursor: pointer">Edit</p>
                        </div>
                        <div class="my-5">
                            <li>{{ $shipping_address->contact_person_name }}</li>
                            <li>{{ "$shipping_address->address, $shipping_address->city, $shipping_address->state, $shipping_address->zip, $shipping_address->country" ?? "" }}
                            </li>
                        </div>
                        <div>
                            @if (isset($type) && $type == "checkout" OR request()->type == 'checkout')
                            <li>Standard Shipping: Free</li>
                            <li><strong>Arrive Friday, December 23rd</strong></li>
                            @elseif (isset($type) && $type == "ethos" OR request()->type == 'ethos')
                            @php($user = User::find(auth('customer')->id()))
                                {{-- for customers --}}
                                @if(isset($user) && !empty($user->student_id))
                                <li>{{ $user->school_name }}</li>
                                <li><strong>{{ $user->tax_student_id }}</strong></li>
                                @endif
                            @else
                            {{-- // for seller --}}
                            <li>Standard Shipping: Free</li>
                            <li><strong>Arrive Friday, December 23rd</strong></li>
                            @endif
                        </div>
                        @else
                        <div class="d-flex">
                            <h3>Please add New shipping address by <a href="javascript:;" onclick="$('#shippingAddressModal').modal('show')" style="cursor: pointer">clicking here</a></h3>
                        </div>
                        @endif
                    </div>
                </div>

                <div class="col-lg-6 col-sm-12">
                    <div class="shopping">
                        <div class="d-flex">
                            <h3>Shopping</h3>
                            <p>Edit</p>
                        </div>
                        @if (isset($type) && $type == "checkout" OR request()->type == 'checkout')
                        <div class="group">
                            <div class="my-4">
                                <div class="d-flex">
                                    <li>Subtotal</li>
                                    <li>{{\App\CPU\Helpers::currency_converter($sub_total)}}</li>
                                </div>
                                <div class="d-flex">
                                    <li>Shipping Fee</li>
                                    <li>{{\App\CPU\Helpers::currency_converter($total_shipping_cost) }}</li>
                                </div>
                                <div class="d-flex">
                                    <li>Discount</li>
                                    <li>{{\App\CPU\Helpers::currency_converter($total_discount_on_product) }}</li>
                                </div>
                                <div class="d-flex">
                                    <li>Tax</li>
                                    <li>{{\App\CPU\Helpers::currency_converter($total_tax)}}</li>
                                </div>
                            </div>

                            <div class="d-flex mt-5">
                                <p><strong>Order Total</strong></p>
                                <p><strong>{{ \App\CPU\Helpers::currency_converter(\App\CPU\CartManager::cart_grand_total(session('cart')) - $coupon_discount) }}</strong></p>
                            </div>
                        </div>
                        @else
                        <div class="group">
                            <div class="my-4">
                                <div class="d-flex">
                                    <li>Subtotal</li>
                                    <li>{{ \App\CPU\Helpers::currency_converter($plan->plan_price) }}</li>
                                </div>
                                <div class="d-flex">
                                    <li>Shipping Fee</li>
                                    <li>Free</li>
                                </div>
                                <div class="d-flex">
                                    <li>Tax</li>
                                    <li>$0.00</li>
                                </div>
                            </div>

                            <div class="d-flex mt-5">
                                <p><strong>Order Total</strong></p>
                                <p><strong>{{ \App\CPU\Helpers::currency_converter($plan->plan_price) }}</strong></p>
                            </div>
                        </div>
                        @endif
                    </div>
                </div>

                <div class="col-lg-6 col-sm-12">
                    <div class="payment">
                        <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                            <div class="row">
                                <li class="nav-item col-6" role="presentation">
                                    <img class="switchy active" id="pills-PayPal-tab" data-bs-toggle="pill"
                                        data-bs-target="#pills-PayPal" type="button" role="tab"
                                        aria-controls="pills-PayPal" aria-selected="true"
                                        src="{{ asset('assets/front-end/img/paypal.svg') }}" width="100%" alt="">
                                </li>
                                <li class="nav-item col-6" role="presentation">
                                    <img class="switchy" id="pills-home-tab" data-bs-toggle="pill"
                                        data-bs-target="#pills-home" type="button" role="tab"
                                        aria-controls="pills-home" aria-selected="true"
                                        src="https://cdn.freebiesupply.com/logos/large/2x/stripe-logo-svg-vector.svg"
                                        width="70%">
                                </li>
                            </div>
                        </ul>
                        <div class="tab-content" id="pills-tabContent">
                            <div class="tab-pane fade" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                                <form id="payment-form">
                                    <div id="payment-element"></div>
                                    <button class="btn btn-scudin mt-3 w-100">Pay</button>
                                    <div id="error-messages"></div>
                                </form>
                            </div>
                            <div class="tab-pane fade show active" id="pills-PayPal" role="tabpanel"
                                aria-labelledby="pills-PayPal-tab">
                                <form action="{{ route('checkout.form', 'paypal') }}" method="post">
                                    @csrf
                                    <div class="col-12 my-3">
                                        <label for="cardNumber">Card number</label>
                                        <input type="tel" class="form-control form-control-md" required name="cc_num"
                                            id="cardNumber" placeholder="1234 1234 1234 1234">
                                    </div>
                                    <div class="row">
                                        <div class="col-6 mb-3">
                                            <label for="ExpireDate">Expiration</label>
                                            <input type="tel" class="form-control form-control-md" required
                                                name="cc_exp" id="ExpireDate" placeholder="MM / YYYY">
                                        </div>
                                        <div class="col-6 mb-3">
                                            <label for="CVVnumber">CVC</label>
                                            <div class="input-group">
                                                <input type="hidden" name="planId" value="{{ $plan->id ?? null }}">
                                                <input type="tel" class="form-control form-control-md" required
                                                    name="cc_cvv" id="CVVnumber" placeholder="CVC">
                                                {{-- <span>
                                                    <svg class="p-CardCvcIcons-svg" width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" fill="var(--colorIconCardCvc)" role="img" aria-labelledby="cvcDesc"><path opacity=".2" fill-rule="evenodd" clip-rule="evenodd" d="M15.337 4A5.493 5.493 0 0013 8.5c0 1.33.472 2.55 1.257 3.5H4a1 1 0 00-1 1v1a1 1 0 001 1h16a1 1 0 001-1v-.6a5.526 5.526 0 002-1.737V18a2 2 0 01-2 2H3a2 2 0 01-2-2V6a2 2 0 012-2h12.337zm6.707.293c.239.202.46.424.662.663a2.01 2.01 0 00-.662-.663z"></path><path opacity=".4" fill-rule="evenodd" clip-rule="evenodd" d="M13.6 6a5.477 5.477 0 00-.578 3H1V6h12.6z"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M18.5 14a5.5 5.5 0 110-11 5.5 5.5 0 010 11zm-2.184-7.779h-.621l-1.516.77v.786l1.202-.628v3.63h.943V6.22h-.008zm1.807.629c.448 0 .762.251.762.613 0 .393-.37.668-.904.668h-.235v.668h.283c.565 0 .95.282.95.691 0 .393-.377.66-.911.66-.393 0-.786-.126-1.194-.37v.786c.44.189.88.291 1.312.291 1.029 0 1.736-.526 1.736-1.288 0-.535-.33-.967-.88-1.14.472-.157.778-.573.778-1.045 0-.738-.652-1.241-1.595-1.241a3.143 3.143 0 00-1.234.267v.77c.378-.212.763-.33 1.132-.33zm3.394 1.713c.574 0 .974.338.974.778 0 .463-.4.785-.974.785-.346 0-.707-.11-1.076-.337v.809c.385.173.778.26 1.163.26.204 0 .392-.032.573-.08a4.313 4.313 0 00.644-2.262l-.015-.33a1.807 1.807 0 00-.967-.252 3 3 0 00-.448.032V6.944h1.132a4.423 4.423 0 00-.362-.723h-1.587v2.475a3.9 3.9 0 01.943-.133z"></path></svg>
                                                </span> --}}
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row" hidden>
                                        <div class="col-md-6 mb-3">
                                            <label for="firstname">First Name</label>
                                            <input type="text" id="firstname" class="form-control form-control-md"
                                                required readonly placeholder="FirstName"
                                                value="{{ auth()->user()->f_name ?? 'First Name' }}">
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <label for="lastname">Last Name</label>
                                            <input type="text" class="form-control form-control-md" required readonly
                                                placeholder="LastName" id="lastname"
                                                value="{{ auth()->user()->l_name ?? 'Last Name' }}">
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <label for="zipCode">Zip/Postal Code</label>
                                        <input type="text" class="form-control" required id="zipCode"
                                            value="{{ $shipping_address->zip ?? "" }}"
                                            placeholder="Billing zip code">
                                    </div>
                                    @if(!empty($shipping_address))
                                    <button class="text-center btn mt-5 btn-scudin mx-auto w-100">
                                        PLACE ORDER
                                    </button>
                                    @else
                                    <button class="text-center btn mt-5 btn-scudin mx-auto w-100" type="button" onclick="$('#shippingAddressModal').modal('show')">
                                        Add shipping Address
                                    </button>
                                    @endif
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                @if (isset($type) && $type == 'checkout' or request()->type == 'checkout')
                    <div class="col-lg-6 col-sm-12">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">ITEM</th>
                                    <th scope="col">DETAILS</th>
                                    <th scope="col">QTY</th>
                                    <th scope="col">PRICE</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach (session()->get('cart') as $key => $cartItem)
                                    <tr>
                                        <th scope="row">{{ $key + 1 }}</th>
                                        <td><?php if(file_exists(asset($cartItem['thumbnail']))) { $img = $cartItem['thumbnail']; } else { $img = "loader.png"; } ?>
                                            <img src='{{ asset($cartItem['thumbnail']) }}' width="50px"
                                                alt="{{ $cartItem['name'] }}">
                                        </td>
                                        <td>{{ $cartItem['name'] }}</td>
                                        <td>{{ $cartItem['quantity'] }}</td>
                                        <td>{{ \App\CPU\Helpers::currency_converter(($cartItem['price'] - $cartItem['discount']) * $cartItem['quantity']) }}
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                @elseif (isset($type) && $type == 'ethos' or request()->type == 'ethos')
                    <div class="col-lg-6 col-sm-12">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">ITEM</th>
                                    <th scope="col">DETAILS</th>
                                    <th scope="col">QTY</th>
                                    <th scope="col">PRICE</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th scope="row">1</th>
                                    <td>
                                        <img src='{{ asset('default.svg') }}' width="30px" alt="Subscription">
                                    </td>
                                    <td>{{ $plan->plan_name }}</td>
                                    <td>1</td>
                                    <td>{{ \App\CPU\Helpers::currency_converter($plan->plan_price) }}
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                @endif
            </div>
        </div>
    </section>
    <!-- shipping Address Modal -->
    <div class="modal fade" id="shippingAddressModal" tabindex="-1" role="dialog" aria-labelledby="modelTitleId"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Add Shipping Address</h5>
          <button onclick="$('#shippingAddressModal').modal('hide')" type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <form action="{{route('address-store')}}" method="post">
            @csrf
            <div class="col-md-12" style="display: flex">
              <ul class="donate-now">
                <li>
                  <input type="radio" id="home" name="addressAs" value="home" />
                  <label for="home" class="component">{{ __('Home')}}</label>
                </li>
                <li>
                  <input type="radio" id="office" name="addressAs" value="office" />
                  <label for="office" class="component">{{ __('Office')}}</label>
                </li>

              </ul>
            </div>

            <!-- Tab panes -->
            <div class="panel">
              <div id="home"><br>
                <div class="row">
                  <div class="form-group col-md-6">
                    <label for="name">{{ __('contact_person_name')}}</label>
                    <input class="form-control" type="text" id="name" name="name" required>
                  </div>
                  <div class="form-group col-md-6">
                    <label for="address">{{ __('address')}}</label>
                    <input class="form-control" type="text" id="address" onfocus="initialize(this.id)" name="address"
                      required>
                  </div>
                  <div id="map"></div>
                  <div id="infowindow-content">
                    <span id="place-name" class="title"></span><br />
                    <span id="place-address"></span>
                  </div>
                </div>
                <div class="row">
                  <div class="form-group col-md-6">
                    <label for="address-city">{{ __('City')}}</label>
                    <input class="form-control" type="text" id="address-city" name="city" required>
                  </div>
                  <div class="form-group col-md-6">
                    <label for="zip">{{ __('zip_code')}}</label>
                    <input class="form-control" type="number" id="zip" name="zip" required>
                  </div>
                </div>
                <div class="row">
                  <div class="form-group col-md-6">
                    <label for="state">{{ __('State')}}</label>
                    <input type="text" class="form-control" id="state" name="state" placeholder="" required>
                  </div>
                  <div class="form-group col-md-6">
                    <label for="country">{{ __('Country')}}</label>
                    <input type="text" class="form-control" id="country" name="country" placeholder="" required>
                  </div>
                </div>
                <div class="row">
                  <div class="form-group col-md-12">
                    <label for="firstName">{{ __('Phone')}}</label>
                    <input class="form-control" type="text" id="phone" name="phone" required>
                  </div>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" onclick="$('#shippingAddressModal').modal('hide')" data-dismiss="modal">{{ __('close')}}</button>
                <button type="submit" class="btn btn-primary">{{ __('Add')}} {{ __('Informations')}} </button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
    </div>
    @if(!empty($shipping_address))
    {{-- Modal Address Edit --}}
    <div class="modal fade" id="editAddress_{{$shipping_address->id}}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog  modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <div class="row">
              <div class="col-md-12">
                <h5 class="modal-title font-name ">{{ __('update')}} {{ __('address')}} </h5>
              </div>
            </div>
          </div>
          <div class="modal-body">
            <form id="updateForm">
              @csrf
              <div class="pb-3" style="display: flex">
                <!-- Nav pills -->
                <input type="hidden" id="defaultValue" class="add_type" value="{{$shipping_address->address_type}}">
                <ul class="donate-now">
                  <li class="address_type_li">
                    <input type="radio" class="address_type" id="a50" name="addressAs" value="home" {{ $shipping_address->address_type == 'home' ? 'checked' : ''}} />
                    <label for="a50" class="component">{{ __('Home')}}</label>
                  </li>
                  <li class="address_type_li">
                    <input type="radio" class="address_type" id="a75" name="addressAs" value="office" {{ $shipping_address->address_type == 'office' ? 'checked' : ''}} />
                    <label for="a75" class="component">{{ __('Office')}}</label>
                  </li>
                </ul>
              </div>
              <!-- Tab panes -->
              <div class="row">
                <div class="form-group col-md-6">
                  <label for="person_name">{{ __('contact_person_name')}}</label>
                  <input class="form-control" type="text" id="person_name" name="name" value="{{$shipping_address->contact_person_name}}" required>
                </div>
                <div class="form-group col-md-6">
                  <label for="own_address">{{ __('address')}}</label>
                  <input class="form-control" type="text" onfocus="initialize(this.id)" id="own_address" name="address" value="{{$shipping_address->address}}" required>
                </div>
              </div>
              <div class="row">
                <div class="form-group col-md-6">
                  <label for="city">{{ __('City')}}</label>

                  <input class="form-control" type="text" id="city" name="city" value="{{$shipping_address->city}}" required>
                </div>
                <div class="form-group col-md-6">
                  <label for="zip_code">{{ __('zip_code')}}</label>
                  <input class="form-control" type="number" id="zip_code" name="zip" value="{{$shipping_address->zip}}" required>
                </div>
              </div>
              <div class="row">
                <div class="form-group col-md-6">
                  <label for="own_state">{{ __('State')}}</label>
                  <input type="text" class="form-control" name="state" value="{{ $shipping_address->state }}" id="own_state" placeholder="" required>
                </div>
                <div class="form-group col-md-6">
                  <label for="own_country">{{ __('Country')}}</label>
                  <input type="text" class="form-control" id="own_country" name="country" value="{{ $shipping_address->country }}" placeholder="" required>
                </div>
              </div>
              <div class="row">
                <div class="form-group col-md-12">
                  <label for="own_phone">{{ __('Phone')}}</label>
                  <input class="form-control" type="text" id="own_phone" name="phone" value="{{$shipping_address->phone}}" required="required">
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="closeB btn btn-secondary" data-dismiss="modal">{{ __('close')}}</button>
                <button type="submit" class="btn btn-primary" id="addressUpdate" data-id="{{$shipping_address->id}}">{{ __('update')}} </button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    @endif
@stop

@push('js')
    <script src="{{ asset('new/payform.min.js') }}"></script>
    <script src="{{ asset('new/cc.js') }}"></script>
    <script src="https://js.stripe.com/v3/"></script>
    <script>
        $("#header2").remove();
        $("#footer-menu").remove();
        $(".brand").remove();
        const stripe = Stripe('<?= $stripi['published_key'] ?>')
        const elements = stripe.elements({
            clientSecret: '<?= $payment_intent->client_secret ?>'
        })
        const paymentElement = elements.create('payment')
        paymentElement.mount("#payment-element")
        const form = document.getElementById('payment-form')
        form.addEventListener('submit', async (e) => {
            e.preventDefault();
            const {
                error
            } = await stripe.confirmPayment({
                elements,
                confirmParams: {
                    return_url: window.location.href =
                        "{{ route('checkout.form', 'stripe') }}?payId={{ $payId->id }}"
                }
            })

            if (error) {
                const messages = document.getElementById('error-messages')
                messages.innerText = error.message
            }
        })



        $('input[name=payment_method]').change(function() {
            console.log($('input[name=payment_method]:checked'));
        });

        function anotherAddress() {
            $('#sh-0').prop('checked', true);
            $("#collapseThree").collapse();
        }

        function shippingMethodsave() {
            // save shippingMethod => set-shipping-method
            $.ajax({
                url: '{{ route('customer.set-shipping-method') }}',
                dataType: 'json',
                type: 'post',
                data: $('#address-form').serialize(),
                beforeSend: function() {
                    $('#loading').show();
                },
                success: function(data) {
                    if (data.errors) {
                        for (var i = 0; i < data.errors.length; i++) {
                            toastr.error(data.errors[i].message, {
                                CloseButton: true,
                                ProgressBar: true
                            });
                        }
                    } else {
                        location.href = '{{ route('checkout-payment') }}';
                    }
                },
                complete: function() {
                    $('#loading').hide();
                },
                error: function() {
                    toastr.error('Something went wrong!', {
                        CloseButton: true,
                        ProgressBar: true
                    });
                }
            });
        }

        $(document).ready(function() { // when next is clicked
            $('#shippingMethod').on('click', function() {
                $("#opc-shipping_method").addClass('allow active');
                $("#opc-billing").removeClass('allow active');
                $("#checkout-step-billing").hide();
                $("#checkout-step-shipping_method").focus().show();
            })

            $('#shippingAddress').on('click', function() {
                var $btn = $(this).button('loading')
                alert('You click me dude: shippingAddress')
                $btn.button('reset')
            })
        });


        function proceed_to_next() {

            let allAreFilled = true;
            document.getElementById("address-form").querySelectorAll("[required]").forEach(function(i) {
                if (!allAreFilled) return;
                if (!i.value) allAreFilled = false;
                if (i.type === "radio") {
                    let radioValueCheck = false;
                    document.getElementById("address-form").querySelectorAll(`[name=${i.name}]`).forEach(function(
                        r) {
                        if (r.checked) radioValueCheck = true;
                    });
                    allAreFilled = radioValueCheck;
                }
            });


            if (allAreFilled) {
                $.ajaxSetup({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    }
                });
                $.ajax({
                    url: '{{ route('customer.choose-shipping-address') }}',
                    dataType: 'json',
                    type: 'post',
                    data: $('#address-form').serialize(),
                    beforeSend: function() {
                        $('#loading').show();
                    },
                    success: function(data) {
                        if (data.errors) {
                            for (var i = 0; i < data.errors.length; i++) {
                                toastr.error(data.errors[i].message, {
                                    CloseButton: true,
                                    ProgressBar: true
                                });
                            }
                        } else {
                            location.href = '{{ route('checkout-payment') }}';
                        }
                    },
                    complete: function() {
                        $('#loading').hide();
                    },
                    error: function() {
                        toastr.error('Something went wrong!', {
                            CloseButton: true,
                            ProgressBar: true
                        });
                    }
                });
            } else {
                toastr.error('Please fill all required fields', {
                    CloseButton: true,
                    ProgressBar: true
                });
            }
        }
    </script>
    <script>
  $(document).ready(function() {
    $('.address_type_li').on('click', function(e) {
      // e.preventDefault();
      $('.address_type_li').find('.address_type').removeAttr('checked', false);
      $('.address_type_li').find('.component').removeClass('active_address_type');
      $(this).find('.address_type').attr('checked', true);
      $(this).find('.address_type').removeClass('add_type');
      $('#defaultValue').removeClass('add_type');
      $(this).find('.address_type').addClass('add_type');
      $(this).find('.component').addClass('active_address_type');
    });
  })
  $('#addressUpdate').on('click', function(e) {
    e.preventDefault();
    let addressAs, address, name, zip, city, state, country, phone;
    addressAs = $('.add_type').val();
    address = $('#own_address').val();
    name = $('#person_name').val();
    zip = $('#zip_code').val();
    city = $('#city').val();
    state = $('#own_state').val();
    country = $('#own_country').val();
    phone = $('#own_phone').val();
    let id = $(this).attr('data-id');
    if (addressAs != '' && address != '' && name != '' && zip != '' && city != '' && state != '' && country != '' && phone != '') {
      $.ajaxSetup({
        headers: {
          'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
        }
      });
      $.ajax({
        url: "{{route('address-update')}}",
        method: 'POST',
        data: {
          id: id,
          addressAs: addressAs,
          address: address,
          name: name,
          zip: zip,
          city: city,
          state: state,
          country: country,
          phone: phone
        },
        success: function() {
          toastr.success('Address Update Successfully.');
          location.reload();
          // $('#name').val('');
          // $('#link').val('');
          // $('#icon').val('');
          // $('#image-set').val('');
        }
      });
    } else {
      toastr.error('All input field required.');
    }
  });
  // Address autocomplete
  // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">
  google.maps.event.addDomListener(window, 'load', initialize);
  function initialize(id) {
    var input = document.getElementById(id);
    var autocomplete = new google.maps.places.Autocomplete(input);
    autocomplete.addListener('place_changed', function() {
      var place = autocomplete.getPlace();
      // place variable will have all the information you are looking for.
      $('#lat').val(place.geometry['location'].lat());
      $('#long').val(place.geometry['location'].lng());
    });
  }
</script>
@endpush