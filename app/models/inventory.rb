class Inventory < ApplicationRecord
  has_paper_trail

  belongs_to :supplier
  belongs_to :product
  # has_many :transaction_details
end
