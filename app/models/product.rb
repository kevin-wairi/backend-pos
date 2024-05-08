class Product < ApplicationRecord
  has_one_attached :image

  belongs_to :category
  has_many :inventories
  has_many :suppliers, through: :inventories 
end
