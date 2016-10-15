require 'active_record'
#
class Category < ActiveRecord::Base
  validates :name, presence: true
end
