class RenameCompanyTableToAccount < ActiveRecord::Migration[5.2]
  def change
    rename_table :companies, :accounts
    rename_column :employees, :company_id, :account_id
  end
end
