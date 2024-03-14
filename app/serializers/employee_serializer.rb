class EmployeeSerializer < ActiveModel::Serializer
  attributes :id,:firstname, :lastname, :business_name,:email, :role, :phone_number
end
