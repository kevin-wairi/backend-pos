class SupplierSerializer < ActiveModel::Serializer
  attributes :id,:company_name, :firstname, :lastname, :phone_number, :email
  
end
