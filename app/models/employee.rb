class Employee < ApplicationRecord
    has_secure_password
    
    has_many :transaction_records

    validates :email,presence: true, uniqueness: true
end
