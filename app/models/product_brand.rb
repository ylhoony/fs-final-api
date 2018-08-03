class ProductBrand < ApplicationRecord
  belongs_to :account
  validates :name, presence: true, uniqueness: true
end
