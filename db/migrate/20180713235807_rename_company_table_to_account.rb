class RenameCompanyTableToAccount < ActiveRecord::Migration[5.2]
  def change
    rename_table :companies, :accounts
  end
end
