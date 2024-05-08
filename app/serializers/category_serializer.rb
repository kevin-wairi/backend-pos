class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  belongs_to :product_type
end
