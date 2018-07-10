class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :dba
      t.string :street1
      t.string :street2
      t.string :city
      t.string :state
      t.integer :country_id
      t.string :postal_code
      t.integer :currency_id # default currency

      t.timestamps null: false
    end
  end
end
