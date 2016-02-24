class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
    	t.string :name, null: false
    	t.string :brand, null: false
    	t.string :model, null: false
    	t.string :sku, null: false
    	t.integer :price, null: false
    	t.string :desc, null: false

    	t.timestamps
    end

    add_index :products, :brand
    add_index :products, :name
    add_index :products, :sku
    add_index :products, :price
  end
end
