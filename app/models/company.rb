class Company < ApplicationRecord
  has_many :employees
  has_many :users, through: :employees
end
