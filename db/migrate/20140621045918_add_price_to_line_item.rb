class AddPriceToLineItem < ActiveRecord::Migration
  def up
    add_column :line_items, :price, :decimal
    LineItem.all.each do |line|
    	line.price = line.product.price
    end
  end
  def down 
  	remove_column :line_items, :price, :decimal
  end 
end
