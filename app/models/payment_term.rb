class PaymentTerm < ApplicationRecord
  belongs_to :account
  belongs_to :payment_option
  has_many :sales_orders
  has_many :purchase_orders
end
