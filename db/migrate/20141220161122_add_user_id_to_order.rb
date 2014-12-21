class AddUserIdToOrder < ActiveRecord::Migration
  def up
  	add_column :orders , :user_id, :integer
  	add_index :orders, "user_id"
  end
  def down
  	remove_index :orders, "user_id"
  	remove_column :orders, :user_id,  :integer
  end
end
