class Company < ApplicationRecord
  scope :customers, -> { where(tyep: 'Customer') }
  scope :suppliers, -> { where(tyep: 'Supplier') }

  belongs_to :account
  belongs_to :currency
  belongs_to :warehouse, optional: true
  belongs_to :payment_term
  has_many :addresses
  has_many :contacts

  accepts_nested_attributes_for :addresses, :contacts, allow_destroy: true
end
