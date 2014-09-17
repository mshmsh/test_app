class CreateSearches < ActiveRecord::Migration
  def up
    create_table :searches do |t|
      t.string :keywords
      t.decimal :min_price
      t.decimal :max_price

      t.timestamps
    end
  end
  def down
        drop_table :searches
  end
end
