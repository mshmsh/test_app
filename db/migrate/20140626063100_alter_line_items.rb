class AlterLineItems < ActiveRecord::Migration
  def up 
  	add_index :line_items , ["order_id", "product_id", "cart_id"]
  end
  def down 
  	remove_index :line_items, ["order_id", "product_id", "cart_id"]
  end
end
