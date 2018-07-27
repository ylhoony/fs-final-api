class CompanySerializer < ActiveModel::Serializer
  belongs_to :account
  belongs_to :currency
  belongs_to :payment_term
  belongs_to :warehouse
  has_many :addresses
  has_many :contacts

  attributes :id, :name, :tax_id, :comment
end
