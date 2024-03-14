class Employee < ApplicationRecord
    has_secure_password

    # has_many :transactions

    # validates :email,presence: true, uniqueness: true
end
