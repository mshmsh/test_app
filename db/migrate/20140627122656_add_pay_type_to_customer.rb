class AddPayTypeToCustomer < ActiveRecord::Migration
  def up 
  	add_column :customers, :pay_type, :string
  end
  def down 
  	remove_column :customers, :pay_type, :string
  end
end
