class AddOrderIdToLineItem < ActiveRecord::Migration
  def up
    add_column :line_items, :order_id, :integer
  end
  def down 
  	remove_column :line_items, :order_id, :integer
  end 
end
