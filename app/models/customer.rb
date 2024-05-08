class Customer < ApplicationRecord
    has_many :transaction_records
end
