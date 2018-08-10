class AccountSerializer < ActiveModel::Serializer
  belongs_to :country
  belongs_to :currency
  has_many :addresses
  has_many :contacts

  attributes :id, :name, :dba, :street1, :street2, :city, :state, :postal_code
end
