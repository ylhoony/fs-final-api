class CreateWarehouses < ActiveRecord::Migration[5.2]
  def change
    create_table :warehouses do |t|
      t.integer :account_id
      t.string :name
      t.string :contact
      t.string :street1
      t.string :street2
      t.string :city
      t.string :state
      t.integer :country_id
      t.string :postal_code
      t.string :email
      t.string :phone
      t.string :fax
      t.boolean :active

      t.timestamps null: false
    end
  end
end
