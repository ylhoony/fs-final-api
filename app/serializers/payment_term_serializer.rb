class PaymentTermSerializer < ActiveModel::Serializer
  belongs_to :payment_option
  attributes :id, :name, :days, :trade_credit_days, :trade_credit_rate, :active
end
