class Address < ApplicationRecord
  belongs_to :account
  belongs_to :customer, class_name: "Company"
  belongs_to :supplier, class_name: "Company"
end
