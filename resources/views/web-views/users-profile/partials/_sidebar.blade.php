<div class="bg-white border my-3">
  <div class="h3 border-bottom title p-2"> My Account </div>
  <div class="block-content">
    <ul>
      <li class="border-bottom p-2"><a class="{{ Request::is('dashboard*')?'active-menu':'' }}" href="{{ route('dashboard') }}"><span> <i class="fas fa-angle-right"></i> Account Dashboard</span></a></li>
      <li class="border-bottom p-2"><a class="{{ Request::is('plans/*')?'active-menu':'' }}" href="{{ route('plans.list') }}"><span> <i class="fas fa-angle-right"></i> Subscription Plans</span></a></li>
      <li class="border-bottom p-2"><a class="{{Request::is('user-account*')?'active-menu':''}}" href="{{route('user-account')}}"><span> <i class="fas fa-angle-right"></i>  {{ __('profile_info')}} </span></a></li>
      <li class="border-bottom p-2" hidden><a class="{{Request::is('account-address*')?'active-menu':''}}" href="{{ route('account-address') }}"><span>  <i class="fas fa-angle-right"></i> {{ __('address')}} </span></a></li>
      <li class="border-bottom p-2"><a class="{{Request::is('account-oder*') || Request::is('account-order-details*') ? 'active-menu' :''}}" href="{{route('account-oder') }}"><span> <i class="fas fa-angle-right"></i>  {{ __('my_order')}} </span></a></li>
      <li class="border-bottom p-2"><a class="{{Request::is('chat*')?'active-menu':''}}" href="{{route('chat-with-seller')}}"><span> <i class="fas fa-angle-right"></i>  {{ __('Chat with Seller') }}</span></a></li>
      <!-- <li><a href="#"><span> Recurring Profiles</span></a></li>
      <li><a href="#"><span> My Product Reviews</span></a></li> -->
      <li class="border-bottom p-2"><a class="{{Request::is('wishlists*')?'active-menu':''}}" href="{{route('wishlists')}}"><span> <i class="fas fa-angle-right"></i>  {{ __('wish_list') }} </span></a></li>
      <li class="border-bottom p-2"><a class="{{Request::is('account-transaction*')?'active-menu':''}}" href="{{ route('account-transaction') }}"><span> <i class="fas fa-angle-right"></i>  {{ _('My') .' '. _("Transactions") }} </span></a></li>
      <li class="border-bottom p-2"><a class="{{(Request::is('account-ticket*') || Request::is('support-ticket*'))?'active-menu':''}}" href="{{ route('account-tickets') }}"><span>  <i class="fas fa-angle-right"></i> {{ __('support_ticket') }} </span></a></li>
      <li class="p-2 last"><a class="{{Request::is('track-order*')?'active-menu':''}}" href="{{route('track-order.index')}}"><span> <i class="fas fa-angle-right"></i> {{ _('Track') .' '. _("Order") }}</span></a></li>
    </ul>
  </div>
  <!--block-content-->
</div>

<style>
  .active-menu>span {
    color: blue;
  }
</style>