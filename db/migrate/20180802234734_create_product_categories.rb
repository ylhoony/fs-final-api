class CreateProductCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :product_categories do |t|
      t.integer :account_id
      t.string :name
      t.boolean :active, default: true

      t.timestamps null: false
    end
  end
end
