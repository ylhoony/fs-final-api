class WarehouseSerializer < ActiveModel::Serializer
  belongs_to :country
  attributes :id, :name, :contact, :street1,
            :street2, :city, :state, :country_id, 
            :postal_code, :email, :phone, :fax, :active
end
