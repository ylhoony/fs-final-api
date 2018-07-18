class AddCurrentAccountToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :current_account_id, :integer
  end
end
