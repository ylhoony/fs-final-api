class CreatePaymentTerms < ActiveRecord::Migration[5.2]
  def change
    create_table :payment_terms do |t|
      t.integer :account_id
      t.integer :payment_option_id
      t.string :name, null: false
      t.integer :days, default: 0
      t.float :trade_credit_rate
      t.integer :trade_credit_days
      t.boolean :active, default: true

      t.timestamps, null: false
    end
  end
end
