<?php $headerMenu = App\MenuLink::where(['menu_type' => 'header'])->get();
$locale = session()->get('locale');
if ($locale == '') {
    $locale = 'en';
}
$_catty = $_REQUEST['category'] ?? null;
$searchy = $_REQUEST['name'] ?? null;
$Menu1 = App\MenuLink::where(['menu_type' => 'header_1'])->first();
$searchMenu = App\MenuLink::where(['menu_type' => 'header_2'])->get();
$headerMenu = App\MenuLink::where(['menu_type' => 'header'])->get();
$locale = session()->get('locale');
if ($locale == '') {
    $locale = 'en';
}
\App\CPU\Helpers::currency_load();
$currency_code = session('currency_code');
$currency_symbol = session('currency_symbol');
if ($currency_symbol == '') {
    $system_default_currency_info = \session('system_default_currency_info');
    $currency_symbol = $system_default_currency_info->symbol;
    $currency_code = $system_default_currency_info->code;
}
$language = \App\CPU\Helpers::language_load();
$categories = \App\CPU\CategoryManager::parents();
?>
@push('css')
<style>
    .pointer {
        cursor: pointer;
    }
</style>
@endpush

<body style="overflow-x: hidden">
    <style>
        .icaret {
            background-color: #e1a006;
            padding: 2px 5px;
            border-radius: 4px;
        }

        .dropdown-submenu:hover>.dropdown-menu>ul {
            display: block;
            color: initial !important;
        }

        .d-submenu:hover>.drop-down-menu>ul {
            display: block;
            color: initial !important;
        }

        .header-style-1 .header-nav {
            background: #0070c0 !important;
        }

        .is-flex,
        .dropdown-toggle {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .dropdown-hover-all .dropdown-menu,
        .dropdown-hover>.dropdown-menu.dropend {
            margin-left: -1px !important
        }

        .dropdown-item>.dropdown-menu {
            display: block;
        }

        .catty {
            margin-right: 20px;
            margin-left: 10px;
            color: #ffffff;
            cursor: pointer;
        }

        .catty a,
        .dropdown-item {
            color: #000 !important;
        }
    </style>
    <section class="header">
        <div class="container-fluid">
            <nav class="navbar navbar-expand-lg">
                <div class="container-fluid">
                    <a class="navbar-brand" href="{{ url('/') }}">
                        <img src="{{ website_logo() }}" alt="" width="100px" />
                    </a>
                    <form action="{{ route('products') }}" id="__search">
                        <input name="data_from" value="search" hidden="" />
                        <input name="page" value="1" hidden="" />
                        <div class="input-group my-group">
                            <?php $categories = \App\CPU\CategoryManager::parents(); ?>
                            <select class="selectpicker form-control input-lg" style="width: 15%;border-radius: 0px;" data-live-search="true" role="menu" name="category" id="category">
                                <option value="" disabled selected> All</option>
                                @foreach ($categories as $category)
                                <option @if ($_catty==$category->id) selected @endif
                                    value="{{ $category['id'] }}">{{ $category['name'] }}</option>
                                @if ($category->childes->count() > 0)
                                @foreach ($category['childes'] as $subCategory)
                                <option @if ($_catty==$category->id) selected @endif
                                    value="{{ $subCategory['id'] }}">- {{ $subCategory['name'] }}</option>
                                @if ($subCategory->childes->count() > 0)
                                @foreach ($subCategory['childes'] as $subSubCategory)
                                <option @if ($_catty==$category->id) selected @endif
                                    value="{{ $subSubCategory['id'] }}">--
                                    {{ $subSubCategory['name'] }}
                                </option>
                                @endforeach
                                @endif
                                @endforeach
                                @endif
                                @endforeach
                            </select>
                            <input type="text" autocomplete="off" style="width: 70%" class="form-control input-lg" name="name" value="" placeholder="Search Scudin Products" />
                            <span class="input-group-btn">
                                <button class="btn btn-default search-button" type="submit">
                                    <i class="fa-sharp fa-solid fa-magnifying-glass"></i>
                                </button>
                            </span>
                        </div>
                    </form>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse ml-2" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0 gap-2" style="white-space:nowrap;">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    {{ $currency_code . "( $currency_symbol )" }}
                                </a>
                                <ul class="dropdown-menu">
                                    @foreach (\App\Model\Currency::where('status', 1)->get() as $key => $currency)
                                    @if ($currency_symbol != $currency->symbol)
                                    <li><a href="#" class="dropdown-item" onclick="currency_change('{{ $currency->code }}')">{{ $currency->symbol }}
                                            &nbsp; {{ $currency->name }}</a></li>
                                    @endif
                                    @endforeach
                                </ul>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    {{ Config::get('languages')[App::getLocale()] }}
                                </a>
                                <ul class="dropdown-menu">
                                    @foreach (Config::get('languages') as $lang => $language)
                                    @if ($lang != App::getLocale())
                                    <li>
                                        <a class="dropdown-item" href="{{ route('lang', $lang) }}">{{ $language }}</a>
                                    </li>
                                    @endif
                                    @endforeach
                                </ul>
                            </li>
                            <li class="nav-item mr-1">
                                <a class="nav-link" href="{{ url('shop/apply') }}">Sell</a>
                            </li>
                            @if (auth('customer')->check() or auth('seller')->check())
                            <li class="nav-item">
                                <a class="nav-link" href="{{ url('logout') }}">logout</a>
                            </li>
                            <li class="nav-item">
                                @if(auth('seller')->check())
                                <a class="nav-link" href="{{ url('seller/dashboard') }}">
                                    <button class="btn btn-scudin">
                                        My Account
                                    </button>
                                </a>
                                @else
                                <a class="nav-link" href="{{ url('dashboard') }}">
                                    <button class="btn btn-scudin">
                                        My Account
                                    </button>
                                </a>
                                @endif
                            </li>
                            @else
                            <li class="nav-item">
                                <a class="btn btn-scudin" href="{{ url('customer/auth/register') }}">Sign Up</a>
                            </li>
                            <li class="nav-item dropdown px-3" style="border-radius: 5px">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    Login
                                </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a class="dropdown-item" href="{{ url('customer/auth/login') }}">Customer
                                            Login</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="{{ url('seller/auth/login') }}?type=seller">Seller login</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="{{ url('seller/auth/login') }}?type=staff">Staff Login</a>
                                    </li>
                                </ul>
                            </li>
                            @endif
                            <li class="nav-item cart_items" style="padding-top: 0.5rem!important;">
                                @include('layout.cart')
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
    </section>
    @if((new \Jenssegers\Agent\Agent())->isMobile())
    <div class="mobile-logo navbar-brand d-flex justify-content-center mt-3">
        <a class="navbar-brand" href="{{ url('/') }}"><img src="{{ website_logo() }}" alt="" width="100%" /></a>
    </div>
    @endif
    <div class="mobile-search">
        <div class="container">
            <form class="d-flex" method="GET" role="search" action="{{ route('products') }}">
                <input name="data_from" value="search" hidden="" />
                <input name="page" value="1" hidden="" />
                <div class="input-group my-group">
                    <?php $categories = \App\CPU\CategoryManager::parents(); ?>
                    <select class="selectpicker form-control input-lg" style="width: 15%;border-radius: 0px;" data-live-search="true" role="menu" name="category" id="category">
                        <option value="" disabled selected> All</option>
                        @foreach ($categories as $category)
                        <option @if ($_catty==$category->id) selected @endif
                            value="{{ $category['id'] }}">{{ $category['name'] }}</option>
                        @if ($category->childes->count() > 0)
                        @foreach ($category['childes'] as $subCategory)
                        <option @if ($_catty==$category->id) selected @endif
                            value="{{ $subCategory['id'] }}">- {{ $subCategory['name'] }}</option>
                        @if ($subCategory->childes->count() > 0)
                        @foreach ($subCategory['childes'] as $subSubCategory)
                        <option @if ($_catty==$category->id) selected @endif
                            value="{{ $subSubCategory['id'] }}">--
                            {{ $subSubCategory['name'] }}
                        </option>
                        @endforeach
                        @endif
                        @endforeach
                        @endif
                        @endforeach
                    </select>
                    <input type="text" autocomplete="off" style="width: 70%" class="form-control input-lg" name="name" value="" placeholder="Search Scudin Products" />
                    <input type="submit" hidden>
                </div>
                <button type="button" class="btn d-flex btn-scudin position-relative" onclick="window.location.href='{{ url('cart/show') }}'">
                    <i class="fa-solid fa-cart-shopping" style="font-size: 1.5em;"></i>
                    <small style="margin-right: 5px" hidden>Cart</small>
                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                        {{ session()->has('cart') ? count(session()->get('cart')) : 0 }}
                        <span class="visually-hidden">Items in cart</span>
                    </span>
                </button>
            </form>
        </div>
    </div>
    {{-- include header menu 2 --}}
    <section id="header2" class="header2 bg-dark">
        <div class="container-fluid">
            <nav class="navbar navbar-expand-lg">
                <div class="container-fluid">
                    <div class="dropdown">
                        <span id="dropdownMenuButton" class="catty" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="icon fa fa-align-justify fa-fw"></i> All
                        </span>
                        <div class="dropdown-menu dropnu" aria-labelledby="dropdownMenuButton" style="left: -2vw;">
                            @foreach ($categories as $category)
                            <!-- level #2 -->
                            <div class="dropdown dropend">
                                <a class="dropdown-item  @if ($category->childes->count() > 0) dropdown-toggle @endif is-flex" id="dropdown-layouts" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="{{ route('products', ['id' => $category['id'], 'data_from' => 'category', 'page' => 1]) }}">
                                    &emsp; {{ $category['name'] }}
                                </a>
                                <div class="dropdown-menu sub-menu-dropdown" aria-labelledby="dropdown-layouts" style="top: -15px">
                                    <!-- level #3 -->
                                    <div class="dropdown dropend">
                                        @if ($category->childes->count() > 0)
                                            @foreach($category['childes'] as $subCategory)
                                                <div class="dropdown dropend">
                                                    <a class="dropdown-item @if ($subCategory->childes->count() > 0) dropdown-toggle @endif" href="{{route('products',['id'=> $subCategory['id'],'data_from'=>'category','page'=>1])}}" id="dropdown-layouts" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="left: -10vw;">
                                                        &emsp; - {{$subCategory['name']}}
                                                    </a>
                                                    <!-- /level #3 -->
                                                    @if ($subCategory->childes->count() > 0)
                                                        <div class="dropdown-menu" aria-labelledby="dropdown-layouts" data-bs-popper="static">
                                                            @foreach($subCategory['childes'] as $subSubCategory)
                                                            <a class="dropdown-item" href="{{route('products',['id'=> $subSubCategory['id'],'data_from'=>'category','page'=>1])}}">
                                                                &emsp; -- {{$subSubCategory['name']}}
                                                            </a>
                                                            @endforeach
                                                        </div>
                                                    @endif
                                                </div>
                                            @endforeach
                                        @endif
                                    </div>
                                    <!-- /level #3 -->
                                </div>
                            </div>
                            @endforeach
                        </div>
                    </div>
                    <!-- <li class="navbar-brand dropdown">
              <img src="./Asset/Vector.png" alt="" /> Categories
            </li> -->
                    <button class="navbar-toggler bg-light" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                        <div class="navbar-nav">
                            <?php $headerMenu = App\MenuLink::where(['menu_type' => 'header'])->get(); ?>
                            <a href="{{ url('/') }}" data-hover="dropdown" class="nav-link">Home</a>
                            @foreach ($headerMenu->take(7) as $link)
                            <a class="nav-link" href="{{ $link->menu_link }}">{{ $link->menu_title }}</a>
                            @endforeach
                        </div>
                    </div>
                </div>
            </nav>
        </div>
    </section>
    @push('js')
    <script>
        $('.dropdown-toggle').click(function(e) {
            if ($(document).width() > 768) {
                e.preventDefault();
                var url = $(this).attr('href');
                if (url !== '#') {
                    window.location.href = url;
                }
            }
        });
    </script>
    @endpush
