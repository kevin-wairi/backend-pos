class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :firstname, :lastname, :email, :role, :phone_number, :business_name, :password_digest
end
