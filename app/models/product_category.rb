class ProductCategory < ApplicationRecord
  belongs_to :account
  has_many :product_groups
  has_many :products
  validates :name, presence: true, uniqueness: true
end
