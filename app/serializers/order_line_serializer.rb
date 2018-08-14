class OrderLineSerializer < ActiveModel::Serializer
  attributes :id, :order_id, :product_id, :comment, :quantity, :unit_price
end
