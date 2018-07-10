class CreateCurrencies < ActiveRecord::Migration[5.2]
  def change
    create_table :currencies do |t|
      t.string :name, null: false
      t.string :alpha3, null: false
      t.string :numeric, null: false
      t.boolean :active, default: false

      t.timestamps null:false
    end
  end
end
