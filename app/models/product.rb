class Product < ApplicationRecord
  belongs_to :account
  belongs_to :product_brand
  belongs_to :product_category
end
