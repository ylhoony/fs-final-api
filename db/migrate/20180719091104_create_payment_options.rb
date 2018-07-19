class CreatePaymentOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :payment_options do |t|
      t.string :name, null: false
      t.boolean :active, default: false

      t.timestamps null: false
    end
  end
end
