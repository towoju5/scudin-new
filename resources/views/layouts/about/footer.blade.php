<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<?php
$colmun_1 = App\MenuLink::where(['menu_type' => 'footer', 'menu_column' => 'column_1'])->get();
$colmun_2 = App\MenuLink::where(['menu_type' => 'footer', 'menu_column' => 'column_2'])->get();
$colmun_3 = App\MenuLink::where(['menu_type' => 'footer', 'menu_column' => 'column_3'])->get();
$colmun_4 = App\MenuLink::where(['menu_type' => 'footer', 'menu_column' => 'column_4'])->get();
$currency_code = session('currency_code');
   $currency_symbol = session('currency_symbol');
   if ($currency_symbol == "") {
      $system_default_currency_info = \session('system_default_currency_info');
      $currency_symbol = $system_default_currency_info->symbol;
      $currency_code = $system_default_currency_info->code;
   }
   $language = \App\CPU\Helpers::language_load();
   $categories = \App\CPU\CategoryManager::parents()
?>
<!-- back to top -->
<div class="back-to-top">
   @php
   $social_media = \App\Model\SocialMedia::where('active_status', 1)->get();
   @endphp
   @if(isset($social_media))
      @foreach ($social_media as $item)
         <a class="social-btn sb-light sb-{{$item->name}} ml-2 mb-2" href="{{$item->link}}">
             <i class="{{$item->icon}} fa-2x" aria-hidden="true"></i>
         </a>
      @endforeach
   @endif
</div>
<!-- <a id="button"></a> -->
@include('layouts.home.partials.mobile-menu')
<!-- Get to Know Us -->
<div class="get-to-know" style="padding: 10px 30px 30px 10px;">
   <div class="get-to-know-1">
      <h2>{{ str_replace('-', ' ', getenv('column_1')) }}</h2>
      <ul class="links">
         @foreach($colmun_1 as $link)
         <li>
            <a href="{{ $link->menu_link }}" title="{{ $link->menu_title }}">
               {{ $link->menu_title }}
            </a>
         </li>
         @endforeach
      </ul>
   </div>
   <div class="get-to-know-2">
      <h2>{{ str_replace('-', ' ', getenv('column_2')) }}</h2>
      <ul class="links">
         @foreach($colmun_2 as $link)
         <li>
            <a href="{{ $link->menu_link }}" title="{{ $link->menu_title }}">
               {{ $link->menu_title }}
            </a>
         </li>
         @endforeach
      </ul>
   </div>
   <div class="get-to-know-3">
      <h2>{{ str_replace('-', ' ', getenv('column_3')) }}</h2>
      <ul class="links">
         @foreach($colmun_3 as $link)
         <li>
            <a href="{{ $link->menu_link }}" title="{{ $link->menu_title }}">
               {{ $link->menu_title }}
            </a>
         </li>
         @endforeach
      </ul>
   </div>
   <div class="get-to-know-4">
      <h2>{{ str_replace('-', ' ', getenv('column_4')) }}</h2>
      <ul class="links">
         @foreach($colmun_4 as $link)
         <li>
            <a href="{{ $link->menu_link }}" title="{{ $link->menu_title }}">
               {{ $link->menu_title }}
            </a>
         </li>
         @endforeach
      </ul>
   </div>
</div>

    <div id="mySidepanel" class="sidepanel" style="overflow: hidden; left: 0px;">
    <ul class="mobile-menu">
        <a href="javascript:void(0)" class="closebtn mt-2" onclick="closeNav()">×</a>
        <div class="col-md-12" style="margin-top: 1rem; padding: 10px;">
            <div class="row">
                <div class="col-md-6">
                <select name="lang" class="form-control" id="lang">
                    <option disabled selected value="{{route('lang', App::getLocale())}}">
                        {{ Config::get('languages')[App::getLocale()] }}
                    </option>
                    @foreach (Config::get('languages') as $lang => $language)
                    @if ($lang != App::getLocale())
                    <option value="{{route('lang', $lang)}}">{{$language}}</option>
                    @endif
                    @endforeach
                </select>
            </div>
            <!--fl-language-->
            <!-- END For version 1,2,3,4,6 -->
            <!-- For version 1,2,3,4,6 -->
            <div class="col-md-6">
                <select name="currency" class="form-control" id="currency" onchange="currency_change(this.value)">
                    <option disabled selected> {{$currency_symbol}} {{$currency_code}} </option>
                    @foreach (\App\Model\Currency::where('status', 1)->get() as $key => $currency)
                    @if ($currency_symbol != $currency->symbol)
                    <option value="{{ $currency->code }}"> {{$currency->symbol}} &nbsp;
                        {{ $currency->name }}
                    </option>
                    @endif
                    @endforeach
                </select>
            </div>
            </div>
        </div>
        <ul class="links">
            @if(auth('customer')->check())
            <li><a href="{{route('dashboard')}}" title="My Account">{{ __('Dashboard') }}</a>
            </li>
            <li><a href="{{route('account-oder')}}" title="{{ __('wish_list') }}">{{ __('my_order') }}</a></li>
            <li><a href="{{route('user-account')}}" title="{{ __('wish_list') }}">{{ __('my_profile') }}</a></li>
            <li><a href="{{route('wishlists')}}" title="{{ __('wish_list') }}">{{ __('wish_list') }}</a></li>
            <li><a href="{{ route('checkout-details') }}" title="{{ __('checkout') }}">{{ __('checkout') }}</a></li>
            <li><a href="{{ route('customer.auth.logout') }}" title="My Account">{{ __('logout') }}</a></li>
            @else
            <li><a href="{{ route('blog.list') }}" title="Blog"><span>Blog</span></a></li>
            <li class="last"><a href="{{ route('customer.auth.login') }}" title="Login"><span>{{ __('sing_in') }}</span></a></li>
            <li class="last"><a href="{{ route('customer.auth.register') }}" title="Login"><span>{{ __('sing_up') }}</span></a></li>
            <li class="last"><a href="{{ route('seller.dashboard') }}" title="Vendors Login"><span>{{ __('seller') }} {{ __('login') }}</span></a>
            </li>
            @endif
        </ul>
    </ul>
</div>

<!-- footer -->
<script>
   var btn = $('#button');

   $(window).scroll(function() {
      if ($(window).scrollTop() > 300) {
         btn.addClass('show');
      } else {
         btn.removeClass('show');
      }
   });

   btn.on('click', function(e) {
      e.preventDefault();
      $('html, body').animate({
         scrollTop: 0
      }, '300');
   });
</script>
<style>
   #button {
      display: inline-block;
      background-color: #FF9800;
      width: 50px;
      height: 50px;
      text-align: center;
      border-radius: 4px;
      position: fixed;
      bottom: 30px;
      right: 30px;
      transition: background-color .3s, opacity .5s, visibility .5s;
      opacity: 0;
      visibility: hidden;
      z-index: 1000;
   }

   #button::after {
      content: "\f077";
      font-family: FontAwesome;
      font-weight: normal;
      font-style: normal;
      font-size: 2em;
      line-height: 50px;
      color: #fff;
   }

   #button:hover {
      cursor: pointer;
      background-color: #333;
   }

   #button:active {
      background-color: #555;
   }

   #button.show {
      opacity: 1;
      visibility: visible;
   }

   /* Styles for the content section */

   .content {
      width: 100%;
      /* margin: 50px auto; */
      font-family: 'Merriweather', serif;
      font-size: 17px;
      color: #6c767a;
      line-height: 1.9;
   }


   ul {
      list-style-type: none;
      margin: 0px;
      padding: 0px;
   }

   a {
      text-decoration: none !important;
   }
   
   
.sidepanel  {
  width: 90%;
  position: fixed;
  z-index: 999;
  /* height: 100%; */
  top: 0;
  left: 0;
  background-color: #252932;
  overflow-x: hidden;
  transition: 0.5s;
  padding-top: 60px;
}
.mobile-menu .form-control {
    height: 34px;
    margin-bottom: 10px
}
.sidepanel a {
  /* padding: 8px 8px 8px 32px; */
  text-decoration: none;
  font-size: 25px;
  color: #e1a006;
  display: block;
  transition: 0.3s;
}

.sidepanel a:hover {
  color: #f1f1f1;
  padding: 10px
}

.sidepanel .closebtn {
  position: absolute;
  top: 0;
  right: 20px;
  font-size: 36px;
  margin-top: -40px;
}

.openbtn {
  font-size: 20px;
  cursor: pointer;
  background-color: #111;
  color: white;
  padding: 10px 15px;
  border: none;
}

.openbtn:hover {
  background-color:#444;
}
</style>

    <script>
        function openNavNow() {
            document.getElementById("mySidepanel").style.width = "90%";
        }

        function closeNav() {
            document.getElementById("mySidepanel").style.width = "0";
        }
        closeNav();
    </script>

