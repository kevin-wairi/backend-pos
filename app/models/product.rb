class Product < ApplicationRecord
  belongs_to :category
  has_many :inventories
end
