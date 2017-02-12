# Jenn's Store #

## Synopsis
Sinatra app of a 'store' and it's 'products'. Attempting to use Ajax, JS, bootstrap, and jQuery.



## Code Example
```ruby   
patch '/api/product/item' do |id|
  product = Product.where(id: id)
  product.update(item: params[:item])
    status 201
  return product.to_json
end
  ```

## Motivation
Class exercise on building web apps.

<!-- ```ruby
``` -->

## Author
Jenn Tustin
