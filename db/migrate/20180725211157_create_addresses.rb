class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :account_id
      t.integer :company_id
      t.string :company_name
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
      t.text :comment
      t.boolean :active, default: true

      t.timestamps null: false
    end
  end
end
