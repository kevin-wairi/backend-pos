class ProductVariantSerializer < ActiveModel::Serializer
  attributes :id, :color, :size, :description, :price
  has_one :product
end
