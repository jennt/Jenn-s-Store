require 'active_record'
#
class CreateProducts < ActiveRecord::Migration[5.0]
  def up
    create_table :products do |t|
      t.string :item
      t.float :price
      t.integer :quantity
      t.references :category, index: true, foreign_key: true
    end
  end

  def down
    drop_table :products
  end
end

def main
  action = (ARGV[0] || :up).to_sym

  CreateProducts.migrate(action)
end

main if __FILE__ == $PROGRAM_NAME
