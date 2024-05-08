Employee.destroy_all
#   Inventory.destroy_all
#   ProductVariant.destroy_all
#   Product.destroy_all
#   Category.destroy_all
#   Customer.destroy_all
ProductType.destroy_all

#   # Clear existing data
# Brand.destroy_all

# db/seeds.rb

# Define the product types
product_types = [
  "Apparel and Accessories",
  "Art and Crafts",
  "Automotive",
  "Books and Stationery",
  "Education and Learning",
  "Electrical and Plumbing",
  "Electronics",
  "Entertainment",
  "Food and Beverages",
  "Gifts and Novelties",
  "Health and Beauty",
  "Home and Garden",
  "Jewelry and Watches",
  "Medical and Pharmaceutical",
  "Office Equipment and Supplies",
  "Pets and Pet Supplies",
  "Services",
  "Sports and Fitness",
  "Toys and Games",
  "Travel and Tourism",
]

# Create ProductType records
product_types.each do |type_name|
  ProductType.create(name: type_name)
end

puts "Product types seeded successfully!"

# data = JSON.parse(File.read('./db.json'))

# # Create Suppliers and Inventory
# data['products'].each do |product|

#   # Supplier.create!(company_name: product['carmake'])
#   supplier = Supplier.find_or_create_by(company_name: product['carMake']) do |s|
#     s.firstname = Faker::Name.first_name
#     s.lastname = Faker::Name.last_name
#     s.phone_number = Faker::PhoneNumber.cell_phone
#     s.email = Faker::Internet.email
#   end
# end

users_data = [
  {
    firstname: Faker::Name.first_name,
    lastname: Faker::Name.last_name,
    business_name: "Admin Corp",
    email: Faker::Internet.email,
    role: "admin",
    phone_number: "1234567890",
    password: "james",
    password_confirmation: "james",
  },
  {
    firstname: Faker::Name.first_name,
    lastname: Faker::Name.last_name,
    business_name: "Default Co.",
    email: "default@example.com",
    role: "default",
    phone_number: "0987654321",
    password: "james",
    password_confirmation: "james",
  },
  {
    firstname: Faker::Name.first_name,
    lastname: Faker::Name.last_name,
    business_name: "Manager Ltd.",
    email: "manager@example.com",
    role: "manager",
    phone_number: "9876543210",
    password: "james",
    password_confirmation: "james",
  },
]

# # Create users using the data
users_data.each do |user_data|
  Employee.create!(user_data)
end

puts "Done Seeding"
