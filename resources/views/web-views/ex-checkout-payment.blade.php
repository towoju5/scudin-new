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
    </style>
@endpush

@section('content')


    @php($shipping_addresses = \App\Model\ShippingAddress::where('customer_id', auth('customer')->id())->get())
    <style>
        .stripe-button-el {
            display: none;
        }
    </style>
    <section class="checkout">
        <div class="container">
            <h2 class="my-5">Checkout</h2>
            <div class="row g-3 my-5">
                <div class="col-lg-6 col-sm-12">
                    <div class="shipping">
                        <div class="d-flex">
                            <h3>Shipping</h3>
                            <p>Edit</p>
                        </div>
                        <div class="my-5">
                            <li>Miracle Great</li>
                            <li>123 North Any Street, Coppell, TX 75019</li>
                        </div>
                        <div>
                            <li>Standard Shipping: Free</li>
                            <li><strong>Arrive Friday, December 23rd</strong></li>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6 col-sm-12">
                    <div class="shopping">
                        <div class="d-flex">
                            <h3>Shopping</h3>
                            <p>Edit</p>
                        </div>
                        <div class="my-4">
                            <div class="d-flex">
                                <li>Subtotal</li>
                                <li>$29.99</li>
                            </div>
                            <div class="d-flex">
                                <li>Shipping Fee</li>
                                <li>Free</li>
                            </div>
                            <div class="d-flex">
                                <li>Tax</li>
                                <li>$2.47</li>
                            </div>
                        </div>

                        <div class="d-flex mt-5">
                            <p><strong>Order Total</strong></p>
                            <p><strong>$32.46</strong></p>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6 col-sm-12">
                    <div class="payment">

                      <form action="{{ route('checkout.form') }}" method="POST" class="row">
                        @csrf
                        <h4>Payment Method</h3>
                          <div class="d-grid gap-2">
                                <label for="stripe">
                                  <input type="radio" class="" name="payment_method" required id="stripe" value="stripe">
                                  <h4 class="text-center p-2 text-light stripe">Stripe</h4>
                                </label>
                                <p class="mb-0"></p>
                                <label for="paypal">
                                  <input type="radio" class="" name="payment_method" required id="paypal" value="paypal">
                                  <h4 class="text-center p-2 text-light mt-3 paypal">PayPal</h4>
                                </label>
                          </div>
                            
                            {{-- <a href="">
                                <h4 class="text-center p-2 text-light mt-3 paypal">PayPal</h4>
                            </a> --}}
                            <p class="text-center">OR</p>
                                <div class="col-12 my-3">
                                    <input type="tel" class="form-control" required name="cc_num" id="cardNumber" placeholder="---- ---- ---- ----">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <input type="tel" class="form-control" required name="cc_exp" id="ExpireDate" placeholder="-- / --">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <input type="tel" class="form-control" required name="cc_cvv" id="CVVnumber" placeholder="---">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <input type="text" class="form-control" required readonly placeholder="FirstName" value="{{ auth()->user()->f_name ?? 'First Name' }}">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <input type="text" class="form-control" required readonly placeholder="LastName" value="{{ auth()->user()->l_name ?? 'Last Name' }}">
                                </div>
                                <div class="col-12">
                                    <input type="text" class="form-control" required id="zipCode" value="{{ auth()->user()->postal ?? 'Zip/Postal code' }}" placeholder="Billing zip code">
                                </div>

                                <button class="text-center p-2 text-light mt-5 stripe mx-auto" style="width: 96%;">
                                    PLACE ORDER
                                </button>
                            </form>
                            <p class="text-center my-3">By clicking Place Order you agree to the <span>Terms &
                                    Conditions.</span></p>
                    </div>
                </div>

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
                                <td><img src="./Asset/product-1 1.png" alt="" width="50px"></td>
                                <td>Kids Printed Strip Outfit For School</td>
                                <td>5</td>
                                <td>$100.00</td>
                            </tr>
                            <tr>
                                <th scope="row">2</th>
                                <td><img src="./Asset/Rectangle3.png" alt="" width="50px"></td>
                                <td>Kids Printed Strip Outfit For School</td>
                                <td>3</td>
                                <td>$29.99</td>
                            </tr>
                            <tr>
                                <th scope="row">3</th>
                                <td><img src="./Asset/product-1 1.png" alt="" width="50px"></td>
                                <td style="width: 50%;">
                                    Kids Outfit Color: Dark Blue Size: 4-5yrs
                                </td>
                                <td>1</td>
                                <td>$200.00</td>
                            </tr>
                            <tr>
                                <th scope="row">4</th>
                                <td><img src="./Asset/Rectangle3.png" alt="" width="50px"></td>
                                <td>Kids Printed Strip Outfit For School</td>
                                <td>3</td>
                                <td>$29.99</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>
@stop

@push('js')
    <script src="{{ asset('new/payform.min.js') }}"></script>
    <script src="{{ asset('new/cc.js') }}"></script>
    <script>
        $('input[name=payment_method]').change(function(){
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
@endpush
