class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :account_id
      t.integer :product_category_id
      t.integer :product_brand_id
      t.string :sku
      t.string :name
      t.text :description
      t.boolean :active
      t.decimal :base_price

      t.timestamps null: false
    end
  end
end