class InventorySerializer < ActiveModel::Serializer
  attributes :id,:supplier_id, :restock_quantity, :wholesale_price, :retail_price, :quantity, :restock_level, :product_id, :status

  belongs_to :supplier
  belongs_to :product
end
