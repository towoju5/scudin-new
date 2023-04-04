<?php
use App\User;


$coupon_discount = session()->has('coupon_discount') ? session('coupon_discount') : 0;
$value = \App\CPU\CartManager::cart_grand_total(session('cart')) - $coupon_discount;

$sub_total = 0;
$total_tax = 0;
$total_shipping_cost = 0;
$total_discount_on_product = 0;
$_msg = "";

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
                  <input type="radio" id="home" required name="addressAs" value="home" />
                  <label for="home" class="component">{{ __('Home')}}</label>
                </li>
                <li>
                  <input type="radio" required id="office" name="addressAs" value="office" />
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
                    <input class="own_address form-control" type="text" id="address" onfocus="initialize(this.id)" name="address"
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
                    <input class="city form-control" type="text" id="address-city" name="city" required>
                  </div>
                  <div class="form-group col-md-6">
                    <label for="zip">{{ __('zip_code')}}</label>
                    <input class="zip_code form-control" type="number" id="zip" name="zip" required>
                  </div>
                </div>
                <div class="row">
                  <div class="form-group col-md-6">
                    <label for="state">{{ __('State')}}</label>
                    <input type="text" class="own_state form-control" id="state" name="state" placeholder="" required>
                  </div>
                  <div class="form-group col-md-6">
                    <label for="country">{{ __('Country')}}</label>
                    {{-- <input type="text" class="own_country form-control" id="country" name="country" placeholder="" required> --}}
                    <select class="own_country form-control" id="country" name="country">
                      <option>select country</option>
                      <option value="AF">Afghanistan</option>
                      <option value="AX">Aland Islands</option>
                      <option value="AL">Albania</option>
                      <option value="DZ">Algeria</option>
                      <option value="AS">American Samoa</option>
                      <option value="AD">Andorra</option>
                      <option value="AO">Angola</option>
                      <option value="AI">Anguilla</option>
                      <option value="AQ">Antarctica</option>
                      <option value="AG">Antigua and Barbuda</option>
                      <option value="AR">Argentina</option>
                      <option value="AM">Armenia</option>
                      <option value="AW">Aruba</option>
                      <option value="AU">Australia</option>
                      <option value="AT">Austria</option>
                      <option value="AZ">Azerbaijan</option>
                      <option value="BS">Bahamas</option>
                      <option value="BH">Bahrain</option>
                      <option value="BD">Bangladesh</option>
                      <option value="BB">Barbados</option>
                      <option value="BY">Belarus</option>
                      <option value="BE">Belgium</option>
                      <option value="BZ">Belize</option>
                      <option value="BJ">Benin</option>
                      <option value="BM">Bermuda</option>
                      <option value="BT">Bhutan</option>
                      <option value="BO">Bolivia</option>
                      <option value="BQ">Bonaire, Sint Eustatius and Saba</option>
                      <option value="BA">Bosnia and Herzegovina</option>
                      <option value="BW">Botswana</option>
                      <option value="BV">Bouvet Island</option>
                      <option value="BR">Brazil</option>
                      <option value="IO">British Indian Ocean Territory</option>
                      <option value="BN">Brunei Darussalam</option>
                      <option value="BG">Bulgaria</option>
                      <option value="BF">Burkina Faso</option>
                      <option value="BI">Burundi</option>
                      <option value="KH">Cambodia</option>
                      <option value="CM">Cameroon</option>
                      <option value="CA">Canada</option>
                      <option value="CV">Cape Verde</option>
                      <option value="KY">Cayman Islands</option>
                      <option value="CF">Central African Republic</option>
                      <option value="TD">Chad</option>
                      <option value="CL">Chile</option>
                      <option value="CN">China</option>
                      <option value="CX">Christmas Island</option>
                      <option value="CC">Cocos (Keeling) Islands</option>
                      <option value="CO">Colombia</option>
                      <option value="KM">Comoros</option>
                      <option value="CG">Congo</option>
                      <option value="CD">Congo, Democratic Republic of the Congo</option>
                      <option value="CK">Cook Islands</option>
                      <option value="CR">Costa Rica</option>
                      <option value="CI">Cote D'Ivoire</option>
                      <option value="HR">Croatia</option>
                      <option value="CU">Cuba</option>
                      <option value="CW">Curacao</option>
                      <option value="CY">Cyprus</option>
                      <option value="CZ">Czech Republic</option>
                      <option value="DK">Denmark</option>
                      <option value="DJ">Djibouti</option>
                      <option value="DM">Dominica</option>
                      <option value="DO">Dominican Republic</option>
                      <option value="EC">Ecuador</option>
                      <option value="EG">Egypt</option>
                      <option value="SV">El Salvador</option>
                      <option value="GQ">Equatorial Guinea</option>
                      <option value="ER">Eritrea</option>
                      <option value="EE">Estonia</option>
                      <option value="ET">Ethiopia</option>
                      <option value="FK">Falkland Islands (Malvinas)</option>
                      <option value="FO">Faroe Islands</option>
                      <option value="FJ">Fiji</option>
                      <option value="FI">Finland</option>
                      <option value="FR">France</option>
                      <option value="GF">French Guiana</option>
                      <option value="PF">French Polynesia</option>
                      <option value="TF">French Southern Territories</option>
                      <option value="GA">Gabon</option>
                      <option value="GM">Gambia</option>
                      <option value="GE">Georgia</option>
                      <option value="DE">Germany</option>
                      <option value="GH">Ghana</option>
                      <option value="GI">Gibraltar</option>
                      <option value="GR">Greece</option>
                      <option value="GL">Greenland</option>
                      <option value="GD">Grenada</option>
                      <option value="GP">Guadeloupe</option>
                      <option value="GU">Guam</option>
                      <option value="GT">Guatemala</option>
                      <option value="GG">Guernsey</option>
                      <option value="GN">Guinea</option>
                      <option value="GW">Guinea-Bissau</option>
                      <option value="GY">Guyana</option>
                      <option value="HT">Haiti</option>
                      <option value="HM">Heard Island and Mcdonald Islands</option>
                      <option value="VA">Holy See (Vatican City State)</option>
                      <option value="HN">Honduras</option>
                      <option value="HK">Hong Kong</option>
                      <option value="HU">Hungary</option>
                      <option value="IS">Iceland</option>
                      <option value="IN">India</option>
                      <option value="ID">Indonesia</option>
                      <option value="IR">Iran, Islamic Republic of</option>
                      <option value="IQ">Iraq</option>
                      <option value="IE">Ireland</option>
                      <option value="IM">Isle of Man</option>
                      <option value="IL">Israel</option>
                      <option value="IT">Italy</option>
                      <option value="JM">Jamaica</option>
                      <option value="JP">Japan</option>
                      <option value="JE">Jersey</option>
                      <option value="JO">Jordan</option>
                      <option value="KZ">Kazakhstan</option>
                      <option value="KE">Kenya</option>
                      <option value="KI">Kiribati</option>
                      <option value="KP">Korea, Democratic People's Republic of</option>
                      <option value="KR">Korea, Republic of</option>
                      <option value="XK">Kosovo</option>
                      <option value="KW">Kuwait</option>
                      <option value="KG">Kyrgyzstan</option>
                      <option value="LA">Lao People's Democratic Republic</option>
                      <option value="LV">Latvia</option>
                      <option value="LB">Lebanon</option>
                      <option value="LS">Lesotho</option>
                      <option value="LR">Liberia</option>
                      <option value="LY">Libyan Arab Jamahiriya</option>
                      <option value="LI">Liechtenstein</option>
                      <option value="LT">Lithuania</option>
                      <option value="LU">Luxembourg</option>
                      <option value="MO">Macao</option>
                      <option value="MK">Macedonia, the Former Yugoslav Republic of</option>
                      <option value="MG">Madagascar</option>
                      <option value="MW">Malawi</option>
                      <option value="MY">Malaysia</option>
                      <option value="MV">Maldives</option>
                      <option value="ML">Mali</option>
                      <option value="MT">Malta</option>
                      <option value="MH">Marshall Islands</option>
                      <option value="MQ">Martinique</option>
                      <option value="MR">Mauritania</option>
                      <option value="MU">Mauritius</option>
                      <option value="YT">Mayotte</option>
                      <option value="MX">Mexico</option>
                      <option value="FM">Micronesia, Federated States of</option>
                      <option value="MD">Moldova, Republic of</option>
                      <option value="MC">Monaco</option>
                      <option value="MN">Mongolia</option>
                      <option value="ME">Montenegro</option>
                      <option value="MS">Montserrat</option>
                      <option value="MA">Morocco</option>
                      <option value="MZ">Mozambique</option>
                      <option value="MM">Myanmar</option>
                      <option value="NA">Namibia</option>
                      <option value="NR">Nauru</option>
                      <option value="NP">Nepal</option>
                      <option value="NL">Netherlands</option>
                      <option value="AN">Netherlands Antilles</option>
                      <option value="NC">New Caledonia</option>
                      <option value="NZ">New Zealand</option>
                      <option value="NI">Nicaragua</option>
                      <option value="NE">Niger</option>
                      <option value="NG">Nigeria</option>
                      <option value="NU">Niue</option>
                      <option value="NF">Norfolk Island</option>
                      <option value="MP">Northern Mariana Islands</option>
                      <option value="NO">Norway</option>
                      <option value="OM">Oman</option>
                      <option value="PK">Pakistan</option>
                      <option value="PW">Palau</option>
                      <option value="PS">Palestinian Territory, Occupied</option>
                      <option value="PA">Panama</option>
                      <option value="PG">Papua New Guinea</option>
                      <option value="PY">Paraguay</option>
                      <option value="PE">Peru</option>
                      <option value="PH">Philippines</option>
                      <option value="PN">Pitcairn</option>
                      <option value="PL">Poland</option>
                      <option value="PT">Portugal</option>
                      <option value="PR">Puerto Rico</option>
                      <option value="QA">Qatar</option>
                      <option value="RE">Reunion</option>
                      <option value="RO">Romania</option>
                      <option value="RU">Russian Federation</option>
                      <option value="RW">Rwanda</option>
                      <option value="BL">Saint Barthelemy</option>
                      <option value="SH">Saint Helena</option>
                      <option value="KN">Saint Kitts and Nevis</option>
                      <option value="LC">Saint Lucia</option>
                      <option value="MF">Saint Martin</option>
                      <option value="PM">Saint Pierre and Miquelon</option>
                      <option value="VC">Saint Vincent and the Grenadines</option>
                      <option value="WS">Samoa</option>
                      <option value="SM">San Marino</option>
                      <option value="ST">Sao Tome and Principe</option>
                      <option value="SA">Saudi Arabia</option>
                      <option value="SN">Senegal</option>
                      <option value="RS">Serbia</option>
                      <option value="CS">Serbia and Montenegro</option>
                      <option value="SC">Seychelles</option>
                      <option value="SL">Sierra Leone</option>
                      <option value="SG">Singapore</option>
                      <option value="SX">Sint Maarten</option>
                      <option value="SK">Slovakia</option>
                      <option value="SI">Slovenia</option>
                      <option value="SB">Solomon Islands</option>
                      <option value="SO">Somalia</option>
                      <option value="ZA">South Africa</option>
                      <option value="GS">South Georgia and the South Sandwich Islands</option>
                      <option value="SS">South Sudan</option>
                      <option value="ES">Spain</option>
                      <option value="LK">Sri Lanka</option>
                      <option value="SD">Sudan</option>
                      <option value="SR">Suriname</option>
                      <option value="SJ">Svalbard and Jan Mayen</option>
                      <option value="SZ">Swaziland</option>
                      <option value="SE">Sweden</option>
                      <option value="CH">Switzerland</option>
                      <option value="SY">Syrian Arab Republic</option>
                      <option value="TW">Taiwan, Province of China</option>
                      <option value="TJ">Tajikistan</option>
                      <option value="TZ">Tanzania, United Republic of</option>
                      <option value="TH">Thailand</option>
                      <option value="TL">Timor-Leste</option>
                      <option value="TG">Togo</option>
                      <option value="TK">Tokelau</option>
                      <option value="TO">Tonga</option>
                      <option value="TT">Trinidad and Tobago</option>
                      <option value="TN">Tunisia</option>
                      <option value="TR">Turkey</option>
                      <option value="TM">Turkmenistan</option>
                      <option value="TC">Turks and Caicos Islands</option>
                      <option value="TV">Tuvalu</option>
                      <option value="UG">Uganda</option>
                      <option value="UA">Ukraine</option>
                      <option value="AE">United Arab Emirates</option>
                      <option value="GB">United Kingdom</option>
                      <option value="US">United States</option>
                      <option value="UM">United States Minor Outlying Islands</option>
                      <option value="UY">Uruguay</option>
                      <option value="UZ">Uzbekistan</option>
                      <option value="VU">Vanuatu</option>
                      <option value="VE">Venezuela</option>
                      <option value="VN">Viet Nam</option>
                      <option value="VG">Virgin Islands, British</option>
                      <option value="VI">Virgin Islands, U.s.</option>
                      <option value="WF">Wallis and Futuna</option>
                      <option value="EH">Western Sahara</option>
                      <option value="YE">Yemen</option>
                      <option value="ZM">Zambia</option>
                      <option value="ZW">Zimbabwe</option>
                    </select>
                  </div>
                </div>
                <div class="row">
                  <div class="form-group col-md-12">
                    <label for="firstName">{{ __('Phone')}}</label>
                    <input class="phone form-control" type="text" id="phone" name="phone" required>
                  </div>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" onclick="$('#shippingAddressModal').modal('hide')" data-dismiss="modal">{{ __('close')}}</button>
                <button type="button" id="validateAddr" onclick="validateAddress()" class="validateAddr btn btn-primary">{{__('validate')}} {{__('address')}}</button>
                <button type="submit" class="addressUpdate btn btn-primary" hidden >{{ __('Save')}} </button>
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
                  <input class="form-control own_address" type="text" onfocus="initialize(this.id)" id="own_address" name="address" value="{{$shipping_address->address}}" required>
                </div>
              </div>
              <div class="row">
                <div class="form-group col-md-6">
                  <label for="city">{{ __('City')}}</label>
                  <input class="form-control" type="hidden" id="update_shipping_id" name="city" value="{{$shipping_address->id}}" required>
                  <input class="city form-control" type="text" id="city" name="city" value="{{$shipping_address->city}}" required>
                </div>
                <div class="form-group col-md-6">
                  <label for="zip_code">{{ __('zip_code')}}</label>
                  <input class="zip_code form-control" type="number" id="zip_code" name="zip" value="{{$shipping_address->zip}}" required>
                </div>
              </div>
              <div class="row">
                <div class="form-group col-md-6">
                  <label for="own_state">{{ __('State')}}</label>
                  <input type="text" class="own_state form-control" name="state" value="{{ $shipping_address->state }}" id="own_state" placeholder="" required>
                </div>
                <div class="form-group col-md-6">
                  <label for="own_country">{{ __('Country')}}</label>
                  <select class="own_country form-control" id="own_country" name="country">
                    <option>select country</option>
                    <option <?php if($shipping_address->country == "AF"){ echo "selected"; } ?>  value="AF">Afghanistan</option>
                    <option <?php if($shipping_address->country == "AX"){ echo "selected"; } ?>  value="AX">Aland Islands</option>
                    <option <?php if($shipping_address->country == "AL"){ echo "selected"; } ?>  value="AL">Albania</option>
                    <option <?php if($shipping_address->country == "DZ"){ echo "selected"; } ?>  value="DZ">Algeria</option>
                    <option <?php if($shipping_address->country == "AS"){ echo "selected"; } ?>  value="AS">American Samoa</option>
                    <option <?php if($shipping_address->country == "AD"){ echo "selected"; } ?>  value="AD">Andorra</option>
                    <option <?php if($shipping_address->country == "AO"){ echo "selected"; } ?>  value="AO">Angola</option>
                    <option <?php if($shipping_address->country == "AI"){ echo "selected"; } ?>  value="AI">Anguilla</option>
                    <option <?php if($shipping_address->country == "AQ"){ echo "selected"; } ?>  value="AQ">Antarctica</option>
                    <option <?php if($shipping_address->country == "AG"){ echo "selected"; } ?>  value="AG">Antigua and Barbuda</option>
                    <option <?php if($shipping_address->country == "AR"){ echo "selected"; } ?>  value="AR">Argentina</option>
                    <option <?php if($shipping_address->country == "AM"){ echo "selected"; } ?>  value="AM">Armenia</option>
                    <option <?php if($shipping_address->country == "AW"){ echo "selected"; } ?>  value="AW">Aruba</option>
                    <option <?php if($shipping_address->country == "AU"){ echo "selected"; } ?>  value="AU">Australia</option>
                    <option <?php if($shipping_address->country == "AT"){ echo "selected"; } ?>  value="AT">Austria</option>
                    <option <?php if($shipping_address->country == "AZ"){ echo "selected"; } ?>  value="AZ">Azerbaijan</option>
                    <option <?php if($shipping_address->country == "BS"){ echo "selected"; } ?>  value="BS">Bahamas</option>
                    <option <?php if($shipping_address->country == "BH"){ echo "selected"; } ?>  value="BH">Bahrain</option>
                    <option <?php if($shipping_address->country == "BD"){ echo "selected"; } ?>  value="BD">Bangladesh</option>
                    <option <?php if($shipping_address->country == "BB"){ echo "selected"; } ?>  value="BB">Barbados</option>
                    <option <?php if($shipping_address->country == "BY"){ echo "selected"; } ?>  value="BY">Belarus</option>
                    <option <?php if($shipping_address->country == "BE"){ echo "selected"; } ?>  value="BE">Belgium</option>
                    <option <?php if($shipping_address->country == "BZ"){ echo "selected"; } ?>  value="BZ">Belize</option>
                    <option <?php if($shipping_address->country == "BJ"){ echo "selected"; } ?>  value="BJ">Benin</option>
                    <option <?php if($shipping_address->country == "BM"){ echo "selected"; } ?>  value="BM">Bermuda</option>
                    <option <?php if($shipping_address->country == "BT"){ echo "selected"; } ?>  value="BT">Bhutan</option>
                    <option <?php if($shipping_address->country == "BO"){ echo "selected"; } ?>  value="BO">Bolivia</option>
                    <option <?php if($shipping_address->country == "BQ"){ echo "selected"; } ?>  value="BQ">Bonaire, Sint Eustatius and Saba</option>
                    <option <?php if($shipping_address->country == "BA"){ echo "selected"; } ?>  value="BA">Bosnia and Herzegovina</option>
                    <option <?php if($shipping_address->country == "BW"){ echo "selected"; } ?>  value="BW">Botswana</option>
                    <option <?php if($shipping_address->country == "BV"){ echo "selected"; } ?>  value="BV">Bouvet Island</option>
                    <option <?php if($shipping_address->country == "BR"){ echo "selected"; } ?>  value="BR">Brazil</option>
                    <option <?php if($shipping_address->country == "IO"){ echo "selected"; } ?>  value="IO">British Indian Ocean Territory</option>
                    <option <?php if($shipping_address->country == "BN"){ echo "selected"; } ?>  value="BN">Brunei Darussalam</option>
                    <option <?php if($shipping_address->country == "BG"){ echo "selected"; } ?>  value="BG">Bulgaria</option>
                    <option <?php if($shipping_address->country == "BF"){ echo "selected"; } ?>  value="BF">Burkina Faso</option>
                    <option <?php if($shipping_address->country == "BI"){ echo "selected"; } ?>  value="BI">Burundi</option>
                    <option <?php if($shipping_address->country == "KH"){ echo "selected"; } ?>  value="KH">Cambodia</option>
                    <option <?php if($shipping_address->country == "CM"){ echo "selected"; } ?>  value="CM">Cameroon</option>
                    <option <?php if($shipping_address->country == "CA"){ echo "selected"; } ?>  value="CA">Canada</option>
                    <option <?php if($shipping_address->country == "CV"){ echo "selected"; } ?>  value="CV">Cape Verde</option>
                    <option <?php if($shipping_address->country == "KY"){ echo "selected"; } ?>  value="KY">Cayman Islands</option>
                    <option <?php if($shipping_address->country == "CF"){ echo "selected"; } ?>  value="CF">Central African Republic</option>
                    <option <?php if($shipping_address->country == "TD"){ echo "selected"; } ?>  value="TD">Chad</option>
                    <option <?php if($shipping_address->country == "CL"){ echo "selected"; } ?>  value="CL">Chile</option>
                    <option <?php if($shipping_address->country == "CN"){ echo "selected"; } ?>  value="CN">China</option>
                    <option <?php if($shipping_address->country == "CX"){ echo "selected"; } ?>  value="CX">Christmas Island</option>
                    <option <?php if($shipping_address->country == "CC"){ echo "selected"; } ?>  value="CC">Cocos (Keeling) Islands</option>
                    <option <?php if($shipping_address->country == "CO"){ echo "selected"; } ?>  value="CO">Colombia</option>
                    <option <?php if($shipping_address->country == "KM"){ echo "selected"; } ?>  value="KM">Comoros</option>
                    <option <?php if($shipping_address->country == "CG"){ echo "selected"; } ?>  value="CG">Congo</option>
                    <option <?php if($shipping_address->country == "CD"){ echo "selected"; } ?>  value="CD">Congo, Democratic Republic of the Congo</option>
                    <option <?php if($shipping_address->country == "CK"){ echo "selected"; } ?>  value="CK">Cook Islands</option>
                    <option <?php if($shipping_address->country == "CR"){ echo "selected"; } ?>  value="CR">Costa Rica</option>
                    <option <?php if($shipping_address->country == "CI"){ echo "selected"; } ?>  value="CI">Cote D'Ivoire</option>
                    <option <?php if($shipping_address->country == "HR"){ echo "selected"; } ?>  value="HR">Croatia</option>
                    <option <?php if($shipping_address->country == "CU"){ echo "selected"; } ?>  value="CU">Cuba</option>
                    <option <?php if($shipping_address->country == "CW"){ echo "selected"; } ?>  value="CW">Curacao</option>
                    <option <?php if($shipping_address->country == "CY"){ echo "selected"; } ?>  value="CY">Cyprus</option>
                    <option <?php if($shipping_address->country == "CZ"){ echo "selected"; } ?>  value="CZ">Czech Republic</option>
                    <option <?php if($shipping_address->country == "DK"){ echo "selected"; } ?>  value="DK">Denmark</option>
                    <option <?php if($shipping_address->country == "DJ"){ echo "selected"; } ?>  value="DJ">Djibouti</option>
                    <option <?php if($shipping_address->country == "DM"){ echo "selected"; } ?>  value="DM">Dominica</option>
                    <option <?php if($shipping_address->country == "DO"){ echo "selected"; } ?>  value="DO">Dominican Republic</option>
                    <option <?php if($shipping_address->country == "EC"){ echo "selected"; } ?>  value="EC">Ecuador</option>
                    <option <?php if($shipping_address->country == "EG"){ echo "selected"; } ?>  value="EG">Egypt</option>
                    <option <?php if($shipping_address->country == "SV"){ echo "selected"; } ?>  value="SV">El Salvador</option>
                    <option <?php if($shipping_address->country == "GQ"){ echo "selected"; } ?>  value="GQ">Equatorial Guinea</option>
                    <option <?php if($shipping_address->country == "ER"){ echo "selected"; } ?>  value="ER">Eritrea</option>
                    <option <?php if($shipping_address->country == "EE"){ echo "selected"; } ?>  value="EE">Estonia</option>
                    <option <?php if($shipping_address->country == "ET"){ echo "selected"; } ?>  value="ET">Ethiopia</option>
                    <option <?php if($shipping_address->country == "FK"){ echo "selected"; } ?>  value="FK">Falkland Islands (Malvinas)</option>
                    <option <?php if($shipping_address->country == "FO"){ echo "selected"; } ?>  value="FO">Faroe Islands</option>
                    <option <?php if($shipping_address->country == "FJ"){ echo "selected"; } ?>  value="FJ">Fiji</option>
                    <option <?php if($shipping_address->country == "FI"){ echo "selected"; } ?>  value="FI">Finland</option>
                    <option <?php if($shipping_address->country == "FR"){ echo "selected"; } ?>  value="FR">France</option>
                    <option <?php if($shipping_address->country == "GF"){ echo "selected"; } ?>  value="GF">French Guiana</option>
                    <option <?php if($shipping_address->country == "PF"){ echo "selected"; } ?>  value="PF">French Polynesia</option>
                    <option <?php if($shipping_address->country == "TF"){ echo "selected"; } ?>  value="TF">French Southern Territories</option>
                    <option <?php if($shipping_address->country == "GA"){ echo "selected"; } ?>  value="GA">Gabon</option>
                    <option <?php if($shipping_address->country == "GM"){ echo "selected"; } ?>  value="GM">Gambia</option>
                    <option <?php if($shipping_address->country == "GE"){ echo "selected"; } ?>  value="GE">Georgia</option>
                    <option <?php if($shipping_address->country == "DE"){ echo "selected"; } ?>  value="DE">Germany</option>
                    <option <?php if($shipping_address->country == "GH"){ echo "selected"; } ?>  value="GH">Ghana</option>
                    <option <?php if($shipping_address->country == "GI"){ echo "selected"; } ?>  value="GI">Gibraltar</option>
                    <option <?php if($shipping_address->country == "GR"){ echo "selected"; } ?>  value="GR">Greece</option>
                    <option <?php if($shipping_address->country == "GL"){ echo "selected"; } ?>  value="GL">Greenland</option>
                    <option <?php if($shipping_address->country == "GD"){ echo "selected"; } ?>  value="GD">Grenada</option>
                    <option <?php if($shipping_address->country == "GP"){ echo "selected"; } ?>  value="GP">Guadeloupe</option>
                    <option <?php if($shipping_address->country == "GU"){ echo "selected"; } ?>  value="GU">Guam</option>
                    <option <?php if($shipping_address->country == "GT"){ echo "selected"; } ?>  value="GT">Guatemala</option>
                    <option <?php if($shipping_address->country == "GG"){ echo "selected"; } ?>  value="GG">Guernsey</option>
                    <option <?php if($shipping_address->country == "GN"){ echo "selected"; } ?>  value="GN">Guinea</option>
                    <option <?php if($shipping_address->country == "GW"){ echo "selected"; } ?>  value="GW">Guinea-Bissau</option>
                    <option <?php if($shipping_address->country == "GY"){ echo "selected"; } ?>  value="GY">Guyana</option>
                    <option <?php if($shipping_address->country == "HT"){ echo "selected"; } ?>  value="HT">Haiti</option>
                    <option <?php if($shipping_address->country == "HM"){ echo "selected"; } ?>  value="HM">Heard Island and Mcdonald Islands</option>
                    <option <?php if($shipping_address->country == "VA"){ echo "selected"; } ?>  value="VA">Holy See (Vatican City State)</option>
                    <option <?php if($shipping_address->country == "HN"){ echo "selected"; } ?>  value="HN">Honduras</option>
                    <option <?php if($shipping_address->country == "HK"){ echo "selected"; } ?>  value="HK">Hong Kong</option>
                    <option <?php if($shipping_address->country == "HU"){ echo "selected"; } ?>  value="HU">Hungary</option>
                    <option <?php if($shipping_address->country == "IS"){ echo "selected"; } ?>  value="IS">Iceland</option>
                    <option <?php if($shipping_address->country == "IN"){ echo "selected"; } ?>  value="IN">India</option>
                    <option <?php if($shipping_address->country == "ID"){ echo "selected"; } ?>  value="ID">Indonesia</option>
                    <option <?php if($shipping_address->country == "IR"){ echo "selected"; } ?>  value="IR">Iran, Islamic Republic of</option>
                    <option <?php if($shipping_address->country == "IQ"){ echo "selected"; } ?>  value="IQ">Iraq</option>
                    <option <?php if($shipping_address->country == "IE"){ echo "selected"; } ?>  value="IE">Ireland</option>
                    <option <?php if($shipping_address->country == "IM"){ echo "selected"; } ?>  value="IM">Isle of Man</option>
                    <option <?php if($shipping_address->country == "IL"){ echo "selected"; } ?>  value="IL">Israel</option>
                    <option <?php if($shipping_address->country == "IT"){ echo "selected"; } ?>  value="IT">Italy</option>
                    <option <?php if($shipping_address->country == "JM"){ echo "selected"; } ?>  value="JM">Jamaica</option>
                    <option <?php if($shipping_address->country == "JP"){ echo "selected"; } ?>  value="JP">Japan</option>
                    <option <?php if($shipping_address->country == "JE"){ echo "selected"; } ?>  value="JE">Jersey</option>
                    <option <?php if($shipping_address->country == "JO"){ echo "selected"; } ?>  value="JO">Jordan</option>
                    <option <?php if($shipping_address->country == "KZ"){ echo "selected"; } ?>  value="KZ">Kazakhstan</option>
                    <option <?php if($shipping_address->country == "KE"){ echo "selected"; } ?>  value="KE">Kenya</option>
                    <option <?php if($shipping_address->country == "KI"){ echo "selected"; } ?>  value="KI">Kiribati</option>
                    <option <?php if($shipping_address->country == "KP"){ echo "selected"; } ?>  value="KP">Korea, Democratic People's Republic of</option>
                    <option <?php if($shipping_address->country == "KR"){ echo "selected"; } ?>  value="KR">Korea, Republic of</option>
                    <option <?php if($shipping_address->country == "XK"){ echo "selected"; } ?>  value="XK">Kosovo</option>
                    <option <?php if($shipping_address->country == "KW"){ echo "selected"; } ?>  value="KW">Kuwait</option>
                    <option <?php if($shipping_address->country == "KG"){ echo "selected"; } ?>  value="KG">Kyrgyzstan</option>
                    <option <?php if($shipping_address->country == "LA"){ echo "selected"; } ?>  value="LA">Lao People's Democratic Republic</option>
                    <option <?php if($shipping_address->country == "LV"){ echo "selected"; } ?>  value="LV">Latvia</option>
                    <option <?php if($shipping_address->country == "LB"){ echo "selected"; } ?>  value="LB">Lebanon</option>
                    <option <?php if($shipping_address->country == "LS"){ echo "selected"; } ?>  value="LS">Lesotho</option>
                    <option <?php if($shipping_address->country == "LR"){ echo "selected"; } ?>  value="LR">Liberia</option>
                    <option <?php if($shipping_address->country == "LY"){ echo "selected"; } ?>  value="LY">Libyan Arab Jamahiriya</option>
                    <option <?php if($shipping_address->country == "LI"){ echo "selected"; } ?>  value="LI">Liechtenstein</option>
                    <option <?php if($shipping_address->country == "LT"){ echo "selected"; } ?>  value="LT">Lithuania</option>
                    <option <?php if($shipping_address->country == "LU"){ echo "selected"; } ?>  value="LU">Luxembourg</option>
                    <option <?php if($shipping_address->country == "MO"){ echo "selected"; } ?>  value="MO">Macao</option>
                    <option <?php if($shipping_address->country == "MK"){ echo "selected"; } ?>  value="MK">Macedonia, the Former Yugoslav Republic of</option>
                    <option <?php if($shipping_address->country == "MG"){ echo "selected"; } ?>  value="MG">Madagascar</option>
                    <option <?php if($shipping_address->country == "MW"){ echo "selected"; } ?>  value="MW">Malawi</option>
                    <option <?php if($shipping_address->country == "MY"){ echo "selected"; } ?>  value="MY">Malaysia</option>
                    <option <?php if($shipping_address->country == "MV"){ echo "selected"; } ?>  value="MV">Maldives</option>
                    <option <?php if($shipping_address->country == "ML"){ echo "selected"; } ?>  value="ML">Mali</option>
                    <option <?php if($shipping_address->country == "MT"){ echo "selected"; } ?>  value="MT">Malta</option>
                    <option <?php if($shipping_address->country == "MH"){ echo "selected"; } ?>  value="MH">Marshall Islands</option>
                    <option <?php if($shipping_address->country == "MQ"){ echo "selected"; } ?>  value="MQ">Martinique</option>
                    <option <?php if($shipping_address->country == "MR"){ echo "selected"; } ?>  value="MR">Mauritania</option>
                    <option <?php if($shipping_address->country == "MU"){ echo "selected"; } ?>  value="MU">Mauritius</option>
                    <option <?php if($shipping_address->country == "YT"){ echo "selected"; } ?>  value="YT">Mayotte</option>
                    <option <?php if($shipping_address->country == "MX"){ echo "selected"; } ?>  value="MX">Mexico</option>
                    <option <?php if($shipping_address->country == "FM"){ echo "selected"; } ?>  value="FM">Micronesia, Federated States of</option>
                    <option <?php if($shipping_address->country == "MD"){ echo "selected"; } ?>  value="MD">Moldova, Republic of</option>
                    <option <?php if($shipping_address->country == "MC"){ echo "selected"; } ?>  value="MC">Monaco</option>
                    <option <?php if($shipping_address->country == "MN"){ echo "selected"; } ?>  value="MN">Mongolia</option>
                    <option <?php if($shipping_address->country == "ME"){ echo "selected"; } ?>  value="ME">Montenegro</option>
                    <option <?php if($shipping_address->country == "MS"){ echo "selected"; } ?>  value="MS">Montserrat</option>
                    <option <?php if($shipping_address->country == "MA"){ echo "selected"; } ?>  value="MA">Morocco</option>
                    <option <?php if($shipping_address->country == "MZ"){ echo "selected"; } ?>  value="MZ">Mozambique</option>
                    <option <?php if($shipping_address->country == "MM"){ echo "selected"; } ?>  value="MM">Myanmar</option>
                    <option <?php if($shipping_address->country == "NA"){ echo "selected"; } ?>  value="NA">Namibia</option>
                    <option <?php if($shipping_address->country == "NR"){ echo "selected"; } ?>  value="NR">Nauru</option>
                    <option <?php if($shipping_address->country == "NP"){ echo "selected"; } ?>  value="NP">Nepal</option>
                    <option <?php if($shipping_address->country == "NL"){ echo "selected"; } ?>  value="NL">Netherlands</option>
                    <option <?php if($shipping_address->country == "AN"){ echo "selected"; } ?>  value="AN">Netherlands Antilles</option>
                    <option <?php if($shipping_address->country == "NC"){ echo "selected"; } ?>  value="NC">New Caledonia</option>
                    <option <?php if($shipping_address->country == "NZ"){ echo "selected"; } ?>  value="NZ">New Zealand</option>
                    <option <?php if($shipping_address->country == "NI"){ echo "selected"; } ?>  value="NI">Nicaragua</option>
                    <option <?php if($shipping_address->country == "NE"){ echo "selected"; } ?>  value="NE">Niger</option>
                    <option <?php if($shipping_address->country == "NG"){ echo "selected"; } ?>  value="NG">Nigeria</option>
                    <option <?php if($shipping_address->country == "NU"){ echo "selected"; } ?>  value="NU">Niue</option>
                    <option <?php if($shipping_address->country == "NF"){ echo "selected"; } ?>  value="NF">Norfolk Island</option>
                    <option <?php if($shipping_address->country == "MP"){ echo "selected"; } ?>  value="MP">Northern Mariana Islands</option>
                    <option <?php if($shipping_address->country == "NO"){ echo "selected"; } ?>  value="NO">Norway</option>
                    <option <?php if($shipping_address->country == "OM"){ echo "selected"; } ?>  value="OM">Oman</option>
                    <option <?php if($shipping_address->country == "PK"){ echo "selected"; } ?>  value="PK">Pakistan</option>
                    <option <?php if($shipping_address->country == "PW"){ echo "selected"; } ?>  value="PW">Palau</option>
                    <option <?php if($shipping_address->country == "PS"){ echo "selected"; } ?>  value="PS">Palestinian Territory, Occupied</option>
                    <option <?php if($shipping_address->country == "PA"){ echo "selected"; } ?>  value="PA">Panama</option>
                    <option <?php if($shipping_address->country == "PG"){ echo "selected"; } ?>  value="PG">Papua New Guinea</option>
                    <option <?php if($shipping_address->country == "PY"){ echo "selected"; } ?>  value="PY">Paraguay</option>
                    <option <?php if($shipping_address->country == "PE"){ echo "selected"; } ?>  value="PE">Peru</option>
                    <option <?php if($shipping_address->country == "PH"){ echo "selected"; } ?>  value="PH">Philippines</option>
                    <option <?php if($shipping_address->country == "PN"){ echo "selected"; } ?>  value="PN">Pitcairn</option>
                    <option <?php if($shipping_address->country == "PL"){ echo "selected"; } ?>  value="PL">Poland</option>
                    <option <?php if($shipping_address->country == "PT"){ echo "selected"; } ?>  value="PT">Portugal</option>
                    <option <?php if($shipping_address->country == "PR"){ echo "selected"; } ?>  value="PR">Puerto Rico</option>
                    <option <?php if($shipping_address->country == "QA"){ echo "selected"; } ?>  value="QA">Qatar</option>
                    <option <?php if($shipping_address->country == "RE"){ echo "selected"; } ?>  value="RE">Reunion</option>
                    <option <?php if($shipping_address->country == "RO"){ echo "selected"; } ?>  value="RO">Romania</option>
                    <option <?php if($shipping_address->country == "RU"){ echo "selected"; } ?>  value="RU">Russian Federation</option>
                    <option <?php if($shipping_address->country == "RW"){ echo "selected"; } ?>  value="RW">Rwanda</option>
                    <option <?php if($shipping_address->country == "BL"){ echo "selected"; } ?>  value="BL">Saint Barthelemy</option>
                    <option <?php if($shipping_address->country == "SH"){ echo "selected"; } ?>  value="SH">Saint Helena</option>
                    <option <?php if($shipping_address->country == "KN"){ echo "selected"; } ?>  value="KN">Saint Kitts and Nevis</option>
                    <option <?php if($shipping_address->country == "LC"){ echo "selected"; } ?>  value="LC">Saint Lucia</option>
                    <option <?php if($shipping_address->country == "MF"){ echo "selected"; } ?>  value="MF">Saint Martin</option>
                    <option <?php if($shipping_address->country == "PM"){ echo "selected"; } ?>  value="PM">Saint Pierre and Miquelon</option>
                    <option <?php if($shipping_address->country == "VC"){ echo "selected"; } ?>  value="VC">Saint Vincent and the Grenadines</option>
                    <option <?php if($shipping_address->country == "WS"){ echo "selected"; } ?>  value="WS">Samoa</option>
                    <option <?php if($shipping_address->country == "SM"){ echo "selected"; } ?>  value="SM">San Marino</option>
                    <option <?php if($shipping_address->country == "ST"){ echo "selected"; } ?>  value="ST">Sao Tome and Principe</option>
                    <option <?php if($shipping_address->country == "SA"){ echo "selected"; } ?>  value="SA">Saudi Arabia</option>
                    <option <?php if($shipping_address->country == "SN"){ echo "selected"; } ?>  value="SN">Senegal</option>
                    <option <?php if($shipping_address->country == "RS"){ echo "selected"; } ?>  value="RS">Serbia</option>
                    <option <?php if($shipping_address->country == "CS"){ echo "selected"; } ?>  value="CS">Serbia and Montenegro</option>
                    <option <?php if($shipping_address->country == "SC"){ echo "selected"; } ?>  value="SC">Seychelles</option>
                    <option <?php if($shipping_address->country == "SL"){ echo "selected"; } ?>  value="SL">Sierra Leone</option>
                    <option <?php if($shipping_address->country == "SG"){ echo "selected"; } ?>  value="SG">Singapore</option>
                    <option <?php if($shipping_address->country == "SX"){ echo "selected"; } ?>  value="SX">Sint Maarten</option>
                    <option <?php if($shipping_address->country == "SK"){ echo "selected"; } ?>  value="SK">Slovakia</option>
                    <option <?php if($shipping_address->country == "SI"){ echo "selected"; } ?>  value="SI">Slovenia</option>
                    <option <?php if($shipping_address->country == "SB"){ echo "selected"; } ?>  value="SB">Solomon Islands</option>
                    <option <?php if($shipping_address->country == "SO"){ echo "selected"; } ?>  value="SO">Somalia</option>
                    <option <?php if($shipping_address->country == "ZA"){ echo "selected"; } ?>  value="ZA">South Africa</option>
                    <option <?php if($shipping_address->country == "GS"){ echo "selected"; } ?>  value="GS">South Georgia and the South Sandwich Islands</option>
                    <option <?php if($shipping_address->country == "SS"){ echo "selected"; } ?>  value="SS">South Sudan</option>
                    <option <?php if($shipping_address->country == "ES"){ echo "selected"; } ?>  value="ES">Spain</option>
                    <option <?php if($shipping_address->country == "LK"){ echo "selected"; } ?>  value="LK">Sri Lanka</option>
                    <option <?php if($shipping_address->country == "SD"){ echo "selected"; } ?>  value="SD">Sudan</option>
                    <option <?php if($shipping_address->country == "SR"){ echo "selected"; } ?>  value="SR">Suriname</option>
                    <option <?php if($shipping_address->country == "SJ"){ echo "selected"; } ?>  value="SJ">Svalbard and Jan Mayen</option>
                    <option <?php if($shipping_address->country == "SZ"){ echo "selected"; } ?>  value="SZ">Swaziland</option>
                    <option <?php if($shipping_address->country == "SE"){ echo "selected"; } ?>  value="SE">Sweden</option>
                    <option <?php if($shipping_address->country == "CH"){ echo "selected"; } ?>  value="CH">Switzerland</option>
                    <option <?php if($shipping_address->country == "SY"){ echo "selected"; } ?>  value="SY">Syrian Arab Republic</option>
                    <option <?php if($shipping_address->country == "TW"){ echo "selected"; } ?>  value="TW">Taiwan, Province of China</option>
                    <option <?php if($shipping_address->country == "TJ"){ echo "selected"; } ?>  value="TJ">Tajikistan</option>
                    <option <?php if($shipping_address->country == "TZ"){ echo "selected"; } ?>  value="TZ">Tanzania, United Republic of</option>
                    <option <?php if($shipping_address->country == "TH"){ echo "selected"; } ?>  value="TH">Thailand</option>
                    <option <?php if($shipping_address->country == "TL"){ echo "selected"; } ?>  value="TL">Timor-Leste</option>
                    <option <?php if($shipping_address->country == "TG"){ echo "selected"; } ?>  value="TG">Togo</option>
                    <option <?php if($shipping_address->country == "TK"){ echo "selected"; } ?>  value="TK">Tokelau</option>
                    <option <?php if($shipping_address->country == "TO"){ echo "selected"; } ?>  value="TO">Tonga</option>
                    <option <?php if($shipping_address->country == "TT"){ echo "selected"; } ?>  value="TT">Trinidad and Tobago</option>
                    <option <?php if($shipping_address->country == "TN"){ echo "selected"; } ?>  value="TN">Tunisia</option>
                    <option <?php if($shipping_address->country == "TR"){ echo "selected"; } ?>  value="TR">Turkey</option>
                    <option <?php if($shipping_address->country == "TM"){ echo "selected"; } ?>  value="TM">Turkmenistan</option>
                    <option <?php if($shipping_address->country == "TC"){ echo "selected"; } ?>  value="TC">Turks and Caicos Islands</option>
                    <option <?php if($shipping_address->country == "TV"){ echo "selected"; } ?>  value="TV">Tuvalu</option>
                    <option <?php if($shipping_address->country == "UG"){ echo "selected"; } ?>  value="UG">Uganda</option>
                    <option <?php if($shipping_address->country == "UA"){ echo "selected"; } ?>  value="UA">Ukraine</option>
                    <option <?php if($shipping_address->country == "AE"){ echo "selected"; } ?>  value="AE">United Arab Emirates</option>
                    <option <?php if($shipping_address->country == "GB"){ echo "selected"; } ?>  value="GB">United Kingdom</option>
                    <option <?php if($shipping_address->country == "US"){ echo "selected"; } ?>  value="US">United States</option>
                    <option <?php if($shipping_address->country == "UM"){ echo "selected"; } ?>  value="UM">United States Minor Outlying Islands</option>
                    <option <?php if($shipping_address->country == "UY"){ echo "selected"; } ?>  value="UY">Uruguay</option>
                    <option <?php if($shipping_address->country == "UZ"){ echo "selected"; } ?>  value="UZ">Uzbekistan</option>
                    <option <?php if($shipping_address->country == "VU"){ echo "selected"; } ?>  value="VU">Vanuatu</option>
                    <option <?php if($shipping_address->country == "VE"){ echo "selected"; } ?>  value="VE">Venezuela</option>
                    <option <?php if($shipping_address->country == "VN"){ echo "selected"; } ?>  value="VN">Viet Nam</option>
                    <option <?php if($shipping_address->country == "VG"){ echo "selected"; } ?>  value="VG">Virgin Islands, British</option>
                    <option <?php if($shipping_address->country == "VI"){ echo "selected"; } ?>  value="VI">Virgin Islands, U.s.</option>
                    <option <?php if($shipping_address->country == "WF"){ echo "selected"; } ?>  value="WF">Wallis and Futuna</option>
                    <option <?php if($shipping_address->country == "EH"){ echo "selected"; } ?>  value="EH">Western Sahara</option>
                    <option <?php if($shipping_address->country == "YE"){ echo "selected"; } ?>  value="YE">Yemen</option>
                    <option <?php if($shipping_address->country == "ZM"){ echo "selected"; } ?>  value="ZM">Zambia</option>
                    <option <?php if($shipping_address->country == "ZW"){ echo "selected"; } ?>  value="ZW">Zimbabwe</option>
                  </select>
                </div>
              </div>
              <div class="row">
                <div class="form-group col-md-12">
                  <label for="own_phone">{{ __('Phone')}}</label>
                  <input class="form-control" type="text" id="own_phone" name="phone" value="{{$shipping_address->phone}}" required="required">
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" onclick="$('#editAddress_{{$shipping_address->id}}').modal('hide')" data-dismiss="modal">{{ __('close')}}</button>
                <button type="button" id="validateAddr" onclick="validateAddress()" class="validateAddr btn btn-primary">{{__('validate')}} {{__('address')}}</button>
                <button type="submit" class="addressUpdate btn btn-primary" hidden id="addressUpdate" data-id="{{$shipping_address->id}}">{{ __('update')}} </button>
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
      function validateAddress() {
          $(".validateAddr").empty().append("<i class='fas fa-spinner fa-pulse'></i> Validating...").attr('disabled', true);
          $.ajax({
              url: "{{route('address.validation')}}",
              method: 'POST',
              data: {
                  address: $(".own_address").val(),
                  country: $(".own_country").val(),
                  city: $(".city").val(),
                  state: $(".own_state").val(),
                  postal: $(".zip_code").val(),
                  _token: "{{ csrf_token() }}",
                  id: $(".update_shipping_id").val(),
              },
              dataType: "JSON",
              success: function(response) {
                  if (response.status == 'success') {
                      $(".validateAddr").hide();
                      $(".addressUpdate").attr('hidden', false);
                      $(".addressUpdate").show();
                      $(".validateAddr").empty().append("Validate").attr('disabled', false);
                      toastr.success(response.msg);
                  } else {
                      $(".validateAddr").empty().append("Validate").attr('disabled', false);
                      toastr.error(response.msg);
                  }
              }
          });
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
          phone: phone,
          _token: "{{ csrf_token() }}"
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