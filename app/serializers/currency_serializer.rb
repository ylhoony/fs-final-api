class CurrencySerializer < ActiveModel::Serializer
  attributes :id, :name, :alpha, :numeric, :active
end
