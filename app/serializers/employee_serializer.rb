class EmployeeSerializer < ActiveModel::Serializer
  attributes :id,:firstname, :lastname,:email, :role, :phone_number
end
