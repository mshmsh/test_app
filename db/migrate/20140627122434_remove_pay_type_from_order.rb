class RemovePayTypeFromOrder < ActiveRecord::Migration
  def up
  	remove_column :orders, :pay_type, :string
  end
  def down 
  	add_column :orders , :pay_type, :string
  end
end
