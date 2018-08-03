class CreateProductGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :product_groups do |t|
      t.integer :product_category_id
      t.string :name, null: false
      t.boolean :active, default: true

      t.timestamps null: false
    end
  end
end
