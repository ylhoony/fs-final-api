class ProductsSerializer < ActiveModel::Serializer
  attributes :id, :account_id, :product_brand_id, :product_category_id, :sku, :name, :description, :base_price
end
