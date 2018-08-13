class Product < ApplicationRecord
  belongs_to :account
  belongs_to :product_brand
  belongs_to :product_category
  has_many :order_lines

  validates :sku, presence: true, uniqueness: true
  validates :name, presence: true
end
