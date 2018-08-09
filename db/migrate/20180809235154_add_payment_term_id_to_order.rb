class AddPaymentTermIdToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :payment_term_id, :integer
  end
end
