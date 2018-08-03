class ProductCategory < ApplicationRecord
  belongs_to :account
  has_many :product_groups
  validates :name, presence: true, uniqueness: true
end
