class ProductSerializer < ActiveModel::Serializer
  belongs_to :product_brand
  belongs_to :product_category
  attributes :id, :account_id, :sku, :name, :description, :base_price
end
