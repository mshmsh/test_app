class CreateCustomers < ActiveRecord::Migration
  def up
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :address_1
      t.string :address_2
      t.date :birthday
      t.string :customer_num

      t.timestamps
    end
  end
  def down 
    drop_table :customers
  end 

end
