class ProductCategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :active, :likecount
end
