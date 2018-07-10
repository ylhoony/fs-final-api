class CompanySerializer < ActiveModel::Serializer
  belongs_to :country
  belongs_to :currency

  attributes :id, :name, :dba, :street1, :street2, :city, :state, :postal_code
end
