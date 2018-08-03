class CreateProductBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :product_brands do |t|
      t.integer :account_id
      t.string :name, null: false
      t.boolean :active, default: true

      t.timestamps null: false
    end
  end
end
