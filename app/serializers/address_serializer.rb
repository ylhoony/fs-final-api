class AddressSerializer < ActiveModel::Serializer
  belongs_to :account
  belongs_to :customer, class_name: "Company", foreign_key: "company_id"
  belongs_to :supplier, class_name: "Company", foreign_key: "company_id"
  
  attributes :id, :company_name, :contact,
            :street1, :street2, :city, :state, :postal_code, :country_id,
            :email, :phone, :fax, :comment, :active
end
