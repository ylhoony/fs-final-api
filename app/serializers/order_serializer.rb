class OrderSerializer < ActiveModel::Serializer  
  belongs_to :account
  belongs_to :account_address, class_name: "Address"
  belongs_to :account_contact, class_name: "Contact"

  belongs_to :customer, class_name: "Company", optional: true
  belongs_to :supplier, class_name: "Company", optional: true
  belongs_to :billing_address, class_name: "Address"
  belongs_to :shipping_address, class_name: "Address"

  belongs_to :warehouse
  belongs_to :currency
  belongs_to :payment_term

  has_many :order_lines

  attributes :id, :type, :order_reference, :comment, :order_date
end