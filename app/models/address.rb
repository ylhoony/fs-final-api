class Address < ApplicationRecord
  belongs_to :account, optional: true
  belongs_to :country
  belongs_to :customer, class_name: "Company", foreign_key: "company_id", optional: true
  belongs_to :supplier, class_name: "Company", foreign_key: "company_id", optional: true
end
