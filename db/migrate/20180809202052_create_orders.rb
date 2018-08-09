class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :type
      t.integer :account_id
      t.integer :account_address_id
      t.integer :account_contact_id
      t.integer :customer_id
      t.integer :supplier_id
      t.integer :billing_address_id
      t.integer :shipping_address_id
      t.integer :warehouse_id
      t.integer :currency_id
      t.string :order_reference
      t.text :comment
      t.datetime :order_date

      t.timestamps null: false
    end
  end
end
