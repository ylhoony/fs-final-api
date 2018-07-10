class CountrySerializer < ActiveModel::Serializer
  attributes :id, :name, :alpha2, :alpha3, :numeric, :active
end
