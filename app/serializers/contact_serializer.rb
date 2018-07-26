class ContactSerializer < ActiveModel::Serializer
  belongs_to :customer, class_name: "Company", foreign_key: "company_id"
  belongs_to :supplier, class_name: "Company", foreign_key: "company_id"

  attributes :id, :account_id, :first_name, :last_name, :job_title, :email, :phone, :mobile, :fax, :comment, :active
end
