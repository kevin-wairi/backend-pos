class Category < ApplicationRecord
    
    has_many :products
    belongs_to :product_type

    validates :name, presence: true
end
