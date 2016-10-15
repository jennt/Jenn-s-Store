require 'active_record'
#
class Product < ActiveRecord::Base
  validates :item, :price, :quantity, presence: true
  has_one :category
end
