class ProductBrand < ApplicationRecord
  belongs_to :account
  has_many :products
  validates :name, presence: true, uniqueness: true
end
