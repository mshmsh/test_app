class AddPreviousLoginTimeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :previous_login_time, :datetime
  end
end
