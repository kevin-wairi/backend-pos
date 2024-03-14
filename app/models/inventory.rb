class Inventory < ApplicationRecord
  belongs_to :product
  belongs_to :supplier
  has_many :transaction_details
end
