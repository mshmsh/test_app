class AddLoginTimeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :login_time, :datetime
  end
end
