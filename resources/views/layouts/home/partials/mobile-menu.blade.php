<!-- Mobile Menu-->
<style>
    .dropdown-submenu {
        position: relative;
    }

    .dropdown-submenu .dropdown-menu {
        margin-top: -1px;
        min-width: 250px;
    }

    .mobile-menu li a.active {
        color: #c2c2c2;
    }

    .dropdown-submenu:hover>.dropdown-menu {
        display: block;
    }

    .scaret {
        padding-bottom: 0px !important;
        padding-top: 0px !important;
    }

    li v {
        display: block;
        overflow: scroll;
        white-space: normal;
        color: #c2c2c2;
        text-decoration: none;
        padding: 10px;
        padding-left: 15px;
        font-size: 14px;
        letter-spacing: 0.5px;
        font-family: 'Raleway', sans-serif;
    }
    .fa.pull-right {
        margin-right: 2rem;
    }
</style>
<div id="mobile-menu" style="max-height: 100vh; min-width: 100vw;">
    <ul class="sidebar-menu">
        <li>
            <div class="home">
                <a href="#" style="background-color: #e1a006;"><i class="icon-times"></i>Close</a>
            </div>
        </li>

        <li>
            <a href="{{ route('home') }}">
                <i class="fa fa-home"></i> <span>Home</span>
            </a>
        </li>

        <?php $headerMenu = App\MenuLink::where(['menu_type' => 'header'])->get(); ?>
        @foreach($headerMenu->take(7) as $link)
        <li>
            <a href="{{ $link->menu_link }}" title="{{ $link->menu_title }}">
                {{ $link->menu_title }}
            </a>
        </li>
        @endforeach


        <li class="treeview memenu">
            <?php ($categories = \App\CPU\CategoryManager::parents()) ?>
            <a href="#">
                <span>Categories</span>
                <i class="fa fa-angle-right pull-right"></i>
            </a>
            <ul class="treeview-menu memenu">
                @foreach($categories as $category)
                <li class="memenu">
                    <a class="test" href="{{route('products',['id'=> $category['id'],'data_from'=>'category','page'=>1])}}">
                        &emsp; {{$category['name']}}
                        <?php if ($category->childes->count() > 0) : ?>
                            <i class="fa fa-angle-right pull-right"></i>
                        <?php endif ?>
                    </a>

                    @if($category->childes->count()>0)
                    <ul class="treeview-menu">
                        @foreach($category['childes'] as $subCategory)
                        <li class="memenu">
                            <a href="{{route('products',['id'=> $subCategory['id'],'data_from'=>'category','page'=>1])}}">
                                &emsp; - {{$subCategory['name']}}
                                <?php if ($subCategory->childes->count() > 0) : ?>
                                    <i class="fa fa-angle-right pull-right"></i>
                                <?php endif ?>
                            </a>
                        </li>
                        @if($subCategory->childes->count()>0)
                        <ul class="treeview-menu">
                            @foreach($subCategory['childes'] as $subSubCategory)
                            <li>
                                <a href="{{route('products',['id'=> $subSubCategory['id'],'data_from'=>'category','page'=>1])}}">&emsp;
                                    -- {{$subSubCategory['name']}}
                                </a>
                            </li>
                            @endforeach
                        </ul>
                      @endif
                </li>
                @endforeach
            </ul>
            @endif
        </li>
        @endforeach
    </ul>
    </li>

    <li><a href="{{ route('customer.auth.login') }}">Login</a> </li>

    </ul>
</div>


<script src="https://www.jqueryscript.net/demo/Stylish-Multi-level-Sidebar-Menu-Plugin-With-jQuery-sidebar-menu-js/dist/sidebar-menu.js"></script>


<script>
   $(document).ready(function() {
      $('.sidebar-menu').on("click", function(e) {
         $(this).next('ul').toggle();
         e.stopPropagation();
         e.preventDefault();
      });
   });
    $.sidebarMenu($('.sidebar-menu'))
</script>
