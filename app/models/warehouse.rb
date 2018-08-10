class Warehouse < ApplicationRecord
  belongs_to :account
  belongs_to :country
  has_many :sales_orders
  has_many :purchase_orders
end
