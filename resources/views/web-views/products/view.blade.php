@extends('layout.master')
@section('title', 'Products page')

@push('css')
    <meta property="og:image" content="<?= asset('storage/app/public/company') ?>/<?= $web_config['web_logo'] ?>" />
    <meta property="og:title" content="Products of <?= $web_config['name'] ?> " />
    <meta property="og:url" content="<?= env('APP_URL') ?>">
    <meta property="og:description" content="{!! substr($web_config['about']->value,0,100) !!}">

    <meta property="twitter:card" content="<?= asset('storage/app/public/company') ?>/<?= $web_config['web_logo'] ?>" />
    <meta property="twitter:title" content="Products of <?= $web_config['name'] ?>" />
    <meta property="twitter:url" content="<?= env('APP_URL') ?>">
    <meta property="twitter:description" content="{!! substr($web_config['about']->value,0,100) !!}">
    <style>
    select#xyz {
        border: 0px;
        outline: 0px;
    }

    .modal {
        padding: 0 !important;
        /* override inline padding-right added from js */
    }

    .modal .modal-dialog {
        width: 100%;
        height: 100%;
        margin: 0;
        padding: 0;
    }

    .modal .modal-content {
        height: auto;
        min-height: 100%;
        border: 0 none;
        border-radius: 0;
        box-shadow: none;
    }

    .btn-danger {
        background: -webkit-linear-gradient(332deg, #7367F0, rgba(115, 103, 240, .7));
        background: #e1a006;
        box-shadow: none;
        color: #FFF;
        font-weight: 400;
        border-radius: 4px;
    }

    @media only screen and (min-width: 320px) and (max-width: 790px) {
        .category-products ul.products-grid li.item {
        width: 50%;
        }
    }

    .bg-plus {
        background-color: #e1a006;
        color: #FFF;
        border-radius: 5px;
        padding: 2px;
        float: right;
    }
    </style>
@endpush

@php $location = userLocation() @endphp
@section('content')
    <div class="text-end p-2">
        <div class="container">
            Your shopping location is: {{ $location['cityName'] }}, {{ $location['regionName'] }},
            {{ $location['countryName'] }}
        </div>
    </div>

    <section class="seller-product p-2">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3 col-sm-12 filter-product p-4">
                    @if ((new \Jenssegers\Agent\Agent())->isMobile())
                        <div class="panel visible-xs visible-sm visible-md">
                            <div class="col-12" style="padding-top: 5px;">
                                <select name="sort_by" class="form-control custom-select col sort_by" id="xyz"
                                    onchange="filter(this.value)">
                                    <option value="latest">{{ __('Latest') }}</option>
                                    <option value="low-high">{{ __('low_high') }} {{ __('Price') }} </option>
                                    <option value="high-low">{{ __('high_low') }} {{ __('Price') }}</option>
                                    <option value="a-z">{{ __('a_z') }} {{ __('Order') }}</option>
                                    <option value="z-a">{{ __('z_a') }} {{ __('Order') }}</option>
                                </select>
                            </div>
                            <div class="col-12">
                                <h4 data-toggle="modal" data-target="#myModal">
                                    Filter: <span class="glyphicon glyphicon-th-list" aria-hidden="true"></span>
                                </h4>
                            </div>
                        </div>
                        <!-- Modal -->
                        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                            aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-body">

                                        <div class="cz-sidebar rounded-lg box-shadow-lg" id="shop-sidebar">
                                            <div class="cz-sidebar-body pb-0" style="padding-top: 12px;">
                                                <!-- Filter by price-->
                                                <div class="widget cz-filter mb-4 pb-4 mt-2">
                                                    <h3 class="widget-title" style="font-weight: 700;">{{ __('Price') }}
                                                    </h3>
                                                    <div class="divider-role"
                                                        style="border: 1px solid whitesmoke; margin-bottom: 14px;  margin-top: -6px;">
                                                    </div>
                                                    <div class="input-group input-group-sm mb-1">
                                                        <span class="input-group-addon"
                                                            id="basic-addon1">{{ currency_symbol() }}</span>
                                                        <input style="background: aliceblue;"
                                                            class="cz-filter-search form-control form-control-sm appended-form-control min_price"
                                                            type="number" placeholder="0" min="0" max="1000000"
                                                            id="min_price">
                                                    </div>
                                                    <div>
                                                        <p style="text-align: center;margin-bottom: 1px;">
                                                            {{ __('to') }}</p>
                                                    </div>
                                                    <div class="input-group input-group-sm mb-2">
                                                        <span class="input-group-addon"
                                                            id="basic-addon1">{{ currency_symbol() }}</span>
                                                        <input style="background: aliceblue;" placeholder="100"
                                                            min="100" max="1000000"
                                                            class="cz-filter-search form-control form-control-sm appended-form-control max_price"
                                                            type="number" id="max_price">
                                                    </div>

                                                    <div class="input-group-overlay input-group-sm mb-2"
                                                        style="margin-top: 10px;">
                                                        <button class="btn btn-primary btn-block" onclick="searchByPrice()">
                                                            <span>{{ __('search') }}</span>
                                                        </button>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                        <!-- Categories & Color & Size Sidebar-->
                                        <div class="cz-sidebar rounded-lg box-shadow-lg" id="shop-sidebar">
                                            <div class="cz-sidebar-body">
                                                <!-- Categories-->
                                                <div class="widget widget-categories mb-4 pb-4 border-bottom">
                                                    <h3 class="widget-title" style="font-weight: 700;">
                                                        {{ __('categories') }}</h3>
                                                    <div class="divider-role"
                                                        style="border: 1px solid whitesmoke; margin-bottom: 14px;  margin-top: -6px;">
                                                    </div>
                                                    <div class="accordion mt-n1" id="shop-categories">
                                                        <!-- Shoes-->

                                                        @foreach (\App\CPU\CategoryManager::parents() as $category)
                                                            <div class="icard">
                                                                <div class="icard-header p-1">
                                                                    <label class="for-hover-lable" style="cursor: pointer"
                                                                        onclick="location.href='<?= route('products', ['id' => $category['id'], 'data_from' => 'category', 'page' => 1]) ?>'"><?= $category['name'] ?></label>
                                                                    <strong class="pull-right for-brand-hover"
                                                                        style="cursor: pointer"
                                                                        onclick="$('#collapse-<?= $category['id'] ?>').toggle(400)">
                                                                        {{ $category->childes->count() > 0 ? '+' : '' }}
                                                                    </strong>
                                                                </div>
                                                                <div class="icard-body ml-2"
                                                                    id="collapse-<?= $category['id'] ?>"
                                                                    style="display: none">
                                                                    @foreach ($category->childes as $child)
                                                                        <div class=" for-hover-lable card-header p-1">
                                                                            <label style="cursor: pointer"
                                                                                onclick="location.href='<?= route('products', ['id' => $child['id'], 'data_from' => 'category', 'page' => 1]) ?>'">&ensp;
                                                                                - {{ $child['name'] }}</label>
                                                                            <strong class="pull-right"
                                                                                style="cursor: pointer"
                                                                                onclick="$('#collapse-<?= $child['id'] ?>').toggle(400)">
                                                                                {{ $child->childes->count() > 0 ? '+' : '' }}
                                                                            </strong>
                                                                        </div>
                                                                        <div class="icard-body ml-2"
                                                                            id="collapse-<?= $child['id'] ?>"
                                                                            style="display: none">
                                                                            @foreach ($child->childes as $ch)
                                                                                <div class="icard-header p-1">
                                                                                    <label class="for-hover-lable"
                                                                                        style="cursor: pointer"
                                                                                        onclick="location.href='<?= route('products', ['id' => $ch['id'], 'data_from' => 'category', 'page' => 1]) ?>'">
                                                                                        &emsp; --
                                                                                        {{ $ch['name'] }}</label>
                                                                                </div>
                                                                            @endforeach
                                                                        </div>
                                                                    @endforeach
                                                                </div>
                                                            </div>
                                                        @endforeach
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Brand Sidebar-->
                                        <div class="cz-sidebar rounded-lg box-shadow-lg" id="shop-sidebar"
                                            style="margin-bottom: 11px;">
                                            <div class="cz-sidebar-body">
                                                <!-- Filter by Brand-->
                                                <div class="widget cz-filter mb-4 pb-4 border-bottom mt-2">
                                                    <h3 class="widget-title" style="font-weight: 700;">
                                                        {{ __('brands') }}</h3>
                                                    <div class="divider-role"
                                                        style="border: 1px solid whitesmoke; margin-bottom: 14px;  margin-top: -6px;">
                                                    </div>
                                                    <div class="input-group-overlay input-group-sm mb-2">
                                                        <input style="background: aliceblue" placeholder="Search brand"
                                                            class="cz-filter-search form-control form-control-sm appended-form-control"
                                                            type="text" id="search-brand">
                                                        <div class="input-group-append-overlay">
                                                            <span style="color: #3498db;" class="input-group-text">
                                                                <i class="czi-search"></i>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <ul id="lista1"
                                                        class="widget-list cz-filter-list list-unstyled pt-1"
                                                        style="max-height: 12rem;" data-simplebar
                                                        data-simplebar-auto-hide="false">
                                                        @foreach (\App\CPU\BrandManager::get_brands() as $brand)
                                                            <div class="for-brand-hover" id="brand">
                                                                <li style="cursor: pointer;padding: 2px"
                                                                    onclick="location.href='<?= route('products', ['id' => $brand['id'], 'data_from' => 'brand', 'page' => 1]) ?>'">
                                                                    <?= $brand['name'] ?>
                                                                    @if ($brand['brand_products_count'] > 0)
                                                                        <span class="for-count-value"
                                                                            style="float: right"><?= $brand['brand_products_count'] ?></span>
                                                                    @endif
                                                                </li>
                                                            </div>
                                                        @endforeach
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                        <button type="button" class="btn btn-primary">Save changes</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @else
                        <div class="filter-sort mt-3 p-4">
                            <h3>Sort By</h3>
                            <div class="filter-latest dropdown sign-up px-3 py-1 my-3">
                                <select name="sort_by" class="form-control custom-select col sort_by"
                                    onchange="filter(this.value)">
                                    <option value="latest">{{ __('Latest') }}</option>
                                    <option value="low-high">{{ __('low_high') }} {{ __('Price') }}
                                    </option>
                                    <option value="high-low">{{ __('high_low') }} {{ __('Price') }}
                                    </option>
                                    <option value="a-z">{{ __('a_z') }} {{ __('Order') }}
                                    </option>
                                    <option value="z-a">{{ __('z_a') }} {{ __('Order') }}
                                    </option>
                                </select>
                            </div>

                            <div class="price">
                                <h3>Price</h3>
                                
                            <div class="budget d-flex">
                                <p class="p-2 px-3" style="background: #ffffff">{{ currency_symbol() }}</p>
                                <input type="number" placeholder="0" class="p-2 min_price" min="100" max="1000000" id="min_price" style="width: 100%" />
                            </div>

                                <p class="text-center">TO</p>

                                
                            <div class="budget d-flex">
                                <p class="p-2 px-3" style="background: #ffffff">{{ currency_symbol() }}</p>
                                <input type="number" placeholder="0" class="p-2 max_price" min="100" max="1000000" id="max_price" style="width: 100%" />
                            </div>

                                <a class="budget-button btn btn1 btn-rounded my-4" onclick="searchByPrice()">Start Shopping</a>
                            </div>

                            <div class="brds">
                                <h3 class="my-3">Brands</h3>
                                <!-- <input type="text" placeholder="Search brand" class="py-2 px-3 mb-5" /> -->
                                <div class="input-group-overlay input-group-sm mb-2">
                                    <input style="background: aliceblue"
                                        placeholder="Search brand"
                                        class="cz-filter-search form-control form-control-sm appended-form-control"
                                        type="text" id="search-brand">
                                    <div class="input-group-append-overlay">
                                        <span style="color: #3498db;" class="input-group-text">
                                            <i class="czi-search"></i>
                                        </span>
                                    </div>
                                </div>
                                <ul id="lista1"
                                    class="widget-list cz-filter-list list-unstyled pt-1"
                                    style="max-height: 12rem;" data-simplebar
                                    data-simplebar-auto-hide="false">
                                    @foreach (\App\CPU\BrandManager::get_brands() as $brand)
                                        <div class="for-brand-hover" id="brand">
                                            <li style="cursor: pointer;padding: 2px"
                                                onclick="location.href='<?= route('products', ['id' => $brand['id'], 'data_from' => 'brand', 'page' => 1]) ?>'">
                                                <?= $brand['name'] ?>
                                                @if ($brand['brand_products_count'] > 0)
                                                    <span class="for-count-value" style="float: right"><?= $brand['brand_products_count'] ?></span>
                                                @endif
                                            </li>
                                        </div>
                                    @endforeach
                                </ul>
                            </div>
                        </div>
                    @endif
                </div>

                <div class="col-lg-9 col-sm-12">
                    <div class="row">
                        <div class="d-flex gap-2">
                            @if (count($products) > 0)
                                @include('web-views.products._ajax-products', ['products' => $products])
                            @else
                                <div class="text-center pt-5">
                                    <h2>No Product Found</h2>
                                </div>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection

@push('js')
    <script>
        let min = $('.min_price').val();
        let max = $('.max_price').val();
        let sort_by = $('.sort_by').val();
        let data_from = "{{ $data['data_from'] }}";
        let data_name = "{{ $data['name'] }}"
        let data_id = "{{ $data['id'] }}"

        function openNav() {
            document.getElementById("mySidepanel").style.width = "50%";
        }

        function closeNav() {
            document.getElementById("mySidepanel").style.width = "0";
        }

        function filter(value) {
            $.ajax({
                url: '<?= url('products') ?>',
                type: "GET",
                data: {
                    id: data_id,
                    name: data_name,
                    data_from: data_from,
                    min_price: min,
                    max_price: max,
                    sort_by: value
                },
                dataType: 'json',
                beforeSend: function() {
                    $('#loading').show();
                },
                success: function(response) {
                    $('#ajax-products').html(response.view);
                },
                complete: function() {
                    $('#loading').hide();
                },
            });
        }

        function searchByPrice() {
            var min = $('.min_price').val();
            var max = $('.max_price').val();
            var sort_by = $('.sort_by').val();
            var data_from = "{{ $data['data_from'] }}";
            var data_name = "{{ $data['name'] }}"
            var data_id = "{{ $data['id'] }}"
            $.ajax({
                url: "<?= url('products') ?>",
                type: "GET",
                data: {
                    id: data_id,
                    name: data_name,
                    data_from: data_from,
                    sort_by: sort_by,
                    min_price: min,
                    max_price: max,
                },
                dataType: 'json',
                beforeSend: function() {
                    $('#loading').show();
                },
                success: function(response) {
                    $('#ajax-products').html(response.view);
                    $('#paginator-ajax').html(response.paginator);
                },
                complete: function() {
                    $('#loading').hide();
                },
            });
        }

        $("#search-brand").on("keyup", function() {
            var value = this.value.toLowerCase().trim();
            $("#lista1 div>li").show().filter(function() {
                return $(this).text().toLowerCase().trim().indexOf(value) == -1;
            }).hide();
        });
        $("#search-brand-m").on("keyup", function() {
            var value = this.value.toLowerCase().trim();
            $("#lista1 div>li").show().filter(function() {
                return $(this).text().toLowerCase().trim().indexOf(value) == -1;
            }).hide();
        });
    </script>
@endpush

