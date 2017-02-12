require 'active_record'
require_relative 'models/category'
require_relative 'models/product'
require 'json'
require 'sinatra'
require 'sinatra/cross_origin'
require 'pry'

register Sinatra::CrossOrigin

configure do
  enable :cross_origin
end

  ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])

before do

  content_type :json
end

after do
  ActiveRecord::Base.connection.close
end

# options '/*' do
#   response["Access-Control-Allow-Headers"] = "origin, x-requested-with, content-type"
# end

#make new product
post '/api/product' do
  product = Product.create(id: Product.maximum(:id).next,
   item: params[:item],
   price: params[:price],
   quantity: params[:quantity],
   category_id: params[:category_id]).to_json
end

#get product by id
get '/api/product/:id' do
  product = Product.where(id: params[:id])
  status 201
  return product.to_json
end

#(sorting)get all products sorted by specific column
#and order or fall back by id (order = key?)
get '/api/products' do
  order = params[:order] || 'id'
  Product.order(order).to_json
end

# #(filtering)get all that meet a certain criteria
get '/api/products/selection' do
    selection = params[:selection] || 'id'
    Product.select(selection).to_json

end

#update whole product by id. have to pass ALL keys for it to save
put '/api/product/:id' do
  product = Product.where(id: params[:id])
  product.update(item: params[:item], price: params[:price],
    quantity: params[:quantity], category_id: params[:category_id])
    status 201
  return product.to_json

end

#update just one key
patch '/api/product/item' do |id|
  product = Product.where(id: id)
  product.update(item: params[:item])
    status 201
  return product.to_json
end

#delete product by id
post '/api/product/:id' do
  product = Product.where(id: params[:id]).first
  product.to_json
  product.delete
end

#####CRUD for categories
#Create a new category
post '/api/category' do
  category = Category.create(name: params[:name])
  return category.to_json

end

get '/api/categories' do
  order = params[:order] || 'id'
  Category.order(order).to_json
end

#get category by id
get '/api/category/:id' do
  category = Category.find_by(id: params[:id])
  status 201
  return category.to_json
end

# #(filtering)get all that meet a certain criteria
# $get '/api/categories' do
#
# end
#
# #update whole category by id
# put '/api/category' do
#
# end
#
# #update just one key
# patch '/api/category' do
#
# end
