class ProductSerializer < ActiveModel::Serializer
  attributes :id,:title, :description, :product_type, :quantity, :retail_price, :sku, :category_id, :brand_id, :created_at,:image
  
  has_many :inventories
  include Rails.application.routes.url_helpers

  def image
    if object.image.attached?
        rails_blob_url(object.image)
    else
      []
    end
  end
end
