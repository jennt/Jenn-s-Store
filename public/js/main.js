var $productCreateBtn = $('#product-create-btn')
var $productItem = $('#product-item')
var $productPrice = $('#product-price')
var $productQuantity = $('#product-quantity')
var $productCatId = $('#product-cat-id')

$productCreateBtn.click(function() {
  var item = $productItem.val()
  var price = $productPrice.val()
  var quantity = $productQuantity.val()
  var category_id = $productCatId.val()

  $.ajax({
    method: 'POST',
    url: '/api/product',
    data: {
      item: item,
      price: price,
      quantity: quantity,
      category_id: category_id
    }
  }).done(function(product) {
    console.log('PRODUCT CREATED', product)
  })
})
