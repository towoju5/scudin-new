<?php $headerMenu = App\MenuLink::where(['menu_type' => 'header'])->get();
$locale = session()->get('locale');
if ($locale == "") {
  $locale = "en";
}
\App\CPU\Helpers::currency_load();
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

<div class="mb-5"></div>
<section class="brand d-none d-md-none d-lg-block">
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-3">
          <a href="{{ url('/') }}">
            <img src="{{ website_logo() }}" alt="logo" style="max-width:80px">
          </a>
        </div>
        <div class="col-md-9 flag float-end">
          <div class="d-flex gap-2 float-end">
            <img src="https://www.svgrepo.com/show/405569/flag-for-flag-nigeria.svg" height="33px" alt="Nigeria flag" class="ngn-flag">
            <img src="https://www.svgrepo.com/show/248851/united-states.svg" height="33px" alt="USA flag" class="usa-flag">
            <span><a class="dropdown-toggle pt-2 text-white" href="#" role="button" data-bs-toggle="dropdown"
                aria-expanded="false">
                {{ $currency_code ."( $currency_symbol )" }}
              </a>
              <ul class="dropdown-menu">
                @foreach (\App\Model\Currency::where('status', 1)->get() as $key => $currency)
                @if ($currency_symbol != $currency->symbol)
                <li><a href="#" class="dropdown-item" onclick="currency_change('{{ $currency->code }}')">{{$currency->symbol}} &nbsp; {{ $currency->name }}</a></li>
                @endif
                @endforeach
                {{-- <li>
                  <a class="dropdown-item" href="#">₦ NGN</a>
                </li>
                <li>
                  <a class="dropdown-item" href="#">€ EUR</a>
                </li>
                <li>
                  <a class="dropdown-item" href="#">$ CAD</a>
                </li> --}}
              </ul>
            </span>
          </div>
        </div>
      </div>
    </div>
  </section>

  <section class="footer">
    <div class="container" id="footer-menu">
      <div class="row mb-5">
        <div class="col-lg-3">
          <h4>Partners</h4>
          <p>Manufacturers</p>
        </div>
        <div class="col-lg-3">
          <h4>Company</h4>
          <ul>
            <li>
              <a href="{{ url('about-us') }}">About Us</a>
            </li>
          </ul>
        </div>
        <div class="col-lg-3">
          <h4>Resources</h4>
          <ul>
            <li>
              <a href="{{ url('blog') }}">Blog</a>
            </li>
            <li>
              <a href="{{ url('sell-on-scudin') }}">Sell on scudin</a>
            </li>
          </ul>
        </div>
        <div class="col-lg-3">
          <h4>Legal</h4>
          <ul>
            <li>
              <a href="{{ url('privacy-policy') }}">Privacy Policy</a>
            </li>
            <li>
              <a href="{{ url('terms') }}">Terms & Conditions</a>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <div class="copyright">
      <p>&copy; 2022. Scudin.com, Inc. All Rights Reserved.</p>
    </div>
  </section>

  <section class="mobile-footer">
    <div class="container">
      <div class="row">
        {{-- <div class="col-sm-12"> --}}
          <div class="text-center p-2">
            <div>
              <a href="{{ url('/') }}" class="text-dark">
                <i class="fa-solid fa-house"></i>
              </a>
            </div>
            <div>
              <a href="#" class="text-dark">
                <i class="fa-solid fa-sliders"></i>
              </a>
            </div>
            <div>
              <a href="{{ url('cart/show') }}" class="text-dark">
                  <i class="fa-solid fa-cart-shopping"></i>
              </a>
            </div>
            @if(auth('customer')->check())
            <div>
              <a href="{{ url('dashboard') }}" class="text-dark">
                <i class="fa-solid fa-user"></i>
              </a>
            </div>
            @else
            <div>
              <a href="{{ url('customer/auth/login') }}" class="text-dark">
                <i class="fa-solid fa-sign-in"></i>
              </a>
            </div>
            @endif
            <div>
              <a href="#" class="text-dark">
                <i class="fa-solid fa-magnifying-glass"></i>
              </a>
            </div>
          </div>
        {{-- </div> --}}
      </div>
    </div>
  </section>
</body>

<script src="https://kit.fontawesome.com/fc49c28ef9.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<script src='//cdnjs.cloudflare.com/ajax/libs/jquery.matchHeight/0.7.2/jquery.matchHeight-min.js'></script>
<!-- BEGIN: Theme JS-->
<script src="{{ url('/') }}/app-assets/js/core/app-menu.min.js"></script>
<script src="{{ url('/') }}/app-assets/js/core/app.min.js"></script>
<!-- END: Theme JS-->

<!-- BEGIN: Page JS-->
<script src="{{ url('/') }}/app-assets/js/scripts/pages/page-auth-login.js"></script>
<script src="{{ asset('app-assets/vendors/js/extensions/sweetalert2.all.min.js') }}"></script>
<script src="{{ asset('new/bootstrap5-dropdown-ml-hack.js') }}"></script>
<script>$('.tox-statusbar__branding').remove()</script>
@include('layout.js')
@include('message')
@stack('js')
</html>