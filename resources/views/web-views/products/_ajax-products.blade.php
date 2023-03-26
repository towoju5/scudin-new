<ul class="products-grid" id="ajax-products">
  @include('web-views.partials._single-product', ['p' => $products])
</ul>
<?php 
if(isset($_REQUEST['id']) && !empty($_REQUEST['id'])){
  $__id = $_REQUEST['id'];
} else if (isset($product['id']) && !empty($product['id'])) {
  $__id = $product['id'];
} else {
  $__id = '';
}
?>

@push('js')
<script>
  function filter(value) {
    $.ajax({
      url: "{{ url('products') }}",
      type: 'get',
      data: {
        id: "{{ $__id }}",
        name: "{{$products['name']}}",
        data_from: "{{ $_GET['data_from'] ?? $products['data_from'] }}",
        min_price: "{{ $products['min_price'] }}",
        max_price: "{{ $products['max_price'] }}",
        sort_by: value
      },
      dataType: 'json',
      beforeSend: function() {
        $('#loading').show();
      },
      success: function(response) {
        $('#loading').hide();
        $('#ajax-products').empty().append(response.view);
      },
      complete: function() {
        $('#loading').hide();
      },
    });
  }
</script>
@endpush