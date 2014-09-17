class CreateProducts < ActiveRecord::Migration
  def up
    create_table :products do |t|
      t.string :title
      t.decimal :price
      t.text :description
      t.string :image_url

      t.timestamps
    end
  end
  def down
  	drop_table :products
  end
end
