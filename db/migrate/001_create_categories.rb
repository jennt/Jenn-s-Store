require 'active_record'
#
class CreateCategories < ActiveRecord::Migration[5.0]
  def up
    create_table :categories do |t|
      t.string :name
    end
  end

  def down
    drop_table :categories
  end
end

def main
  action = (ARGV[0] || :up).to_sym

  CreateCategories.migrate(action)
end

main if __FILE__ == $PROGRAM_NAME
