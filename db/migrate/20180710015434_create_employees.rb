class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.integer :user_id
      t.integer :account_id
      t.boolean :subscriber, default: false

      t.timestamps null: false
    end
  end
end
