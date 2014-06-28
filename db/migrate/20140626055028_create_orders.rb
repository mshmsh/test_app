class CreateOrders < ActiveRecord::Migration
  def up
    create_table :orders do |t|
      t.datetime :order_date
      t.string :order_num
      t.string :pay_type

      t.timestamps
    end
  end
  def down 
  	drop_table :orders
  end
end
