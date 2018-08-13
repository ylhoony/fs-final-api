class CreateOrderLines < ActiveRecord::Migration[5.2]
  def change
    create_table :order_lines do |t|
      t.integer :order_id
      t.integer :product_id
      t.text :comment
      t.integer :quantity
      t.decimal :unit_price, precision: 25, scale: 5, default: 0

      t.timestamps null: false
    end
  end
end