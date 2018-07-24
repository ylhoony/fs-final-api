class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.integer :account_id
      t.string :type
      t.string :name
      t.string :tax_id
      t.text :comment
      t.integer :warehouse_id
      t.integer :payment_term_id
      t.integer :currency_id

      t.timestamps null: false
    end
  end
end
