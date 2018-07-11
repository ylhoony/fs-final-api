class CreateCompanyAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :company_addresses do |t|
      t.integer :company_id, null: false
      t.string :name, null: false
      t.string :contact
      t.string :street1
      t.string :street2
      t.string :city
      t.string :state
      t.integer :country_id, null: false
      t.string :postal_code
      t.string :phone
      t.string :email
      t.string :fax
      t.boolean :active, default: true

      t.timestamps null: false
    end
  end
end
