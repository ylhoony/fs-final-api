class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.integer :account_id
      t.integer :company_id
      t.string :first_name
      t.string :last_name
      t.string :job_title
      t.string :email
      t.string :phone
      t.string :mobile
      t.string :fax
      t.string :comment
      t.boolean :active, default: true

      t.timestamps null: false
    end
  end
end
