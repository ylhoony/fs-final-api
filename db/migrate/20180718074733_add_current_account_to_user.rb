class AddCurrentAccountToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :current_account, :integer
  end
end
