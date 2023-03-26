<!DOCTYPE html>
<html lang="en">

<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Subscription Payment</title>
  <?php $fav_logo = \App\Model\BusinessSetting::where(['type' => 'company_fav_icon'])->pluck('value')[0] ?>
  <link rel="apple-touch-icon" href="{{ asset($fav_logo) }}">
  <link rel="shortcut icon" type="image/x-icon" href="{{ asset($fav_logo) }}">
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
   <style>
      @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200&display=swap');

      body {
         background-color: orange;
      }

      * {
         margin: 0;
         padding: 0;
         font-family: 'Poppins', sans-serif
      }

      .container {
         min-height: 100vh;
         display: flex;
         justify-content: center;
         align-items: center
      }

      @media screen and (max-width: 768px) {
         .container {
            padding: 10px;
         }
      }

      .card {
         /* height: 440px;
      width: 350px; */
         background-color: white;
         border-radius: 10px;
         padding: 20px 15px
      }

      .card hr {
         border-top: 1px solid #ccc;
         margin-bottom: 20px;
         margin-top: 10px
      }

      .card h3 {
         letter-spacing: 1px;
         font-size: 20px;
         font-weight: 900
      }

      .card-details {
         position: relative
      }

      .card-details input {
         width: 100%;
         height: 48px;
         padding: 0px 10px;
         box-sizing: border-box;
         border: 3px solid #ccc;
         outline: none;
         border-radius: 10px;
         caret-color: #3769D3;
         font-size: 16px;
         transition: all 1s
      }

      .card-details input:focus {
         border: 3px solid #3769D3
      }

      .card-details input:focus~span {
         color: #3769D3;
         font-weight: 900
      }

      .card-details input:focus~i {
         color: #3769D3
      }

      .card-details span {
         position: absolute;
         top: -10px;
         left: 15px;
         background-color: white;
         font-size: 14px;
         padding: 0px 5px;
         transition: all 1s
      }

      .card-details i {
         position: absolute;
         right: 10px;
         top: 15px;
         color: #ccc;
         z-index: 1000;
         transition: all 1s
      }


      .exp-cvv {
         margin-top: 25px;
         display: flex;
         flex: 0 50%;
         flex-direction: row;
         justify-content: space-between;
         gap: 5px;

      }

      .mt-25 {
         margin-top: 25px
      }

      .tick {
         display: flex;
         padding: 10px 10px;
         align-items: center
      }

      .tick span {
         height: 20px;
         width: 20px;
         border-radius: 50%;
         border: 3px solid blue;
         display: flex;
         justify-content: center;
         align-items: center;
         font-size: 14px;
         cursor: pointer;
         color: #fff
      }

      .d-none {
         display: none
      }

      .tick p {
         margin-left: 15px;
         font-weight: 900;
         font-size: 18px
      }

      .p-blue {
         background-color: blue !important
      }

      .button {
         display: flex;
         justify-content: center;
         align-items: center
      }

      .button button {
         height: 60px;
         width: 100%;
         border-radius: 10px;
         background-color: blue;
         color: white;
         font-size: 18px;
         font-weight: 600;
         transition: all 0.5s;
         cursor: pointer;
         border: none
      }

      .button button:hover {
         background-color: #040481
      }

      card-details input,
      select {
         width: 100%;
         height: 48px;
         padding: 0px 10px;
         box-sizing: border-box;
         border: 3px solid #ccc !important;
         outline: none;
         border-radius: 10px;
         caret-color: #3769D3;
         font-size: 16px;
         transition: all 1s;
      }
   </style>
</head>

<body style="background-color: orange;">
   <div class="d-flex justify-content-center">
      <div class="col-md-8">
         <div class="col-md-12">
            <div class="card mt-5">
               <div class="center">
                  @if(count($errors) > 0 )
                  <div class="alert alert-danger alert-dismissible fade show" role="alert">
                     <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                     </button>
                     <ul class="p-0 m-0" style="list-style: none;">
                        @foreach($errors->all() as $error)
                        <li>{{$error}}</li>
                        @endforeach
                     </ul>
                  </div>
                  @endif
                  <!-- </div> -->
               </div>
               <div class="card-body">
                  <div class="row">
                     <div class="col-md-6">
                        <div class="card">
                           <div class="top">
                              <h3 class="button">User Information</h3>
                              <br>
                           </div>
                           <form action="{{ route('plans.paypal.checkout') }}" method="post">
                              @csrf
                              <div class="card-details">
                                 <select name="payment_type" disabled class="form-control">
                                    <option disabled selected value="{{ $plan->id }}" selected>{{ ucwords($plan->plan_name) }}</option>
                                 </select>
                                 <span>Plan Name</span>
                              </div>
                              <section id="userInfo">
                                 <div class="row">
                                    <div class="col-md-6 mt-25">
                                       <div class="card-details">
                                          <input value="{{ auth('customer')->user()->email ?? NULL }}" disabled>
                                          <span>Email</span>
                                          <i class="fa fa-envelope"></i>
                                       </div>
                                    </div>
                                    <div class="col-md-6 mt-25">
                                       <div class="card-details">
                                          <input value="{{ auth('customer')->user()->name ?? NULL }}" disabled>
                                          <span>Customer Name</span>
                                          <i class="fa fa-user"></i>
                                       </div>
                                    </div>
                                 </div>
                                 <div class="card-details mt-25">
                                    <input placeholder="Address" name="street_address" value="{{ auth('customer')->user()->street_address ?? NULL }}">
                                    <span>Address </span>
                                    <i class="fa fa-location-arrow"></i>
                                    <input type="hidden" name="plan_id" value="{{ $plan_id }}">
                                 </div>
                                 @if($plan->plan_user_type == 'users')
                                 <div class="card-details mt-25">
                                    <input placeholder="School ID Number" required name="school_id" id="school_id">
                                    <span>Student's School ID Number </span>
                                    <i class="fa fa-paw"></i>
                                 </div>
                                 <div class="card-details mt-25">
                                    <input type="text" placeholder="Enter School Name" required name="school_name" id="school_name" autocomplete="off">
                                    <span>School Name</span>
                                 </div>
                                 @else
                                 <div class="card-details mt-25">
                                    <input type="text" placeholder="Phone Number" name="phone_number" id="phone_number" value="{{ auth('customer')->user()->phone ??  auth('seller')->user()->phone }}" autocomplete="off">
                                    <span>Phone Number </span>
                                 </div>
                                 @endif
                                 <!-- <div class="tick"></div>
                              <div class="button"> <button>Subscribe Now</button> </div> -->
                              </section>
                           
                        </div>
                     </div>
                     <div class="col-md-6">
                        <div class="card">
                           <div class="top">
                              <h3 class="button">Credit/Debit Card Checkout</h3>
                              <br>
                           </div>

                              <div class="card-details">
                                 <select name="payment_type" onchange="process(this.value)" class="form-control">
                                    <option value="stripe" selected>Stripe</option>
                                    <option value="paypal">PayPal</option>
                                 </select>
                                 <span>Select Payment Method</span>
                              </div>
                              
                              <div class="tick"></div>
                              <div class="button"> <button>Subscribe Now</button> </div>
                           </form>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
   <script>

      function process(pay) {
         $("#school_id").attr('required', false)
         if (pay == 'paypal') {
            $("#school_id").attr('required', true)
            $("#school_name").attr('required', true)
            $("#phone_number").attr('required', true)
            $("#cardInfo").hide()
         } else {
            $("input").attr('required', true)
            $("#cardInfo").show()
         }
      }
   </script>
</body>

</html>