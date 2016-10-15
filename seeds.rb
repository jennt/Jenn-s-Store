require 'active_record'
require_relative 'models/product'
require_relative 'models/category'

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])

def main
  Category.create(name: 'meat') #1
  Category.create(name: 'dairy') #2
  Category.create(name: 'seafood') #3
  Category.create(name: 'dry goods') #4
  Category.create(name: 'produce') #5
  Category.create(name: 'bakery') #6

  Product.create(item: 'qtip', price: 0.99 , quantity: 100, category_id: 4)
  Product.create(item: 'milk', price: 2.99 , quantity: 25, category_id: 2)
  Product.create(item: 'beef', price: 2.99 , quantity: 15, category_id: 1)
  Product.create(item: 'shrimp', price: 5.99 , quantity: 30, category_id: 3)
  Product.create(item: 'cupcakes', price: 3.99 , quantity: 200, category_id: 6)
  Product.create(item: 'bananas', price: 0.99 , quantity: 75, category_id: 5)
  Product.create(item: 'cheerios', price: 3.49 , quantity: 20, category_id: 4)
end

main if __FILE__ == $PROGRAM_NAME
#bundle install
#rake db:migrate
#ruby seeds.rb
#shotgun app.rb
#postman
