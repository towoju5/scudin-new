<button type="button" class="btn d-flex btn-scudin position-relative"
    onclick="window.location.href='{{ url('cart/show') }}'">
    <i class="fa-solid fa-cart-shopping"></i>
    <small style="margin-right: 5px; color:white">Cart</small>
    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
        {{ session()->has('cart') ? count(session()->get('cart')) : 0 }}
        <span class="visually-hidden">Items in cart</span>
    </span>
</button>
