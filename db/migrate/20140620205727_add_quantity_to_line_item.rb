class AddQuantityToLineItem < ActiveRecord::Migration
  def up
    add_column :line_items, :quantity, :integer, :default => 1
  end
  def down 
  	remove_column :line_items, :quantity, :integer
  end

end
