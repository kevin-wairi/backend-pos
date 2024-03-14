# Clear existing data
puts "Clearing seed Data"
Customer.destroy_all
Employee.destroy_all
Supplier.destroy_all

puts "Seeding Customers"
5.times do
  username = Faker::Internet.username(specifier: 5..8)
  credit_limit = Faker::Number.between(from: 100, to: 100000)
  phone_number = Faker::PhoneNumber.phone_number
  email = Faker::Internet.email

  Customer.create!(
    username: username,
    credit_limit: credit_limit,
    phone_number: phone_number,
    email: email
  )
end

# Seed Employees
puts "Seeding Employees"
5.times do
  firstname = Faker::Name.first_name
  lastname = Faker::Name.last_name
  business_name = Faker::Company.name
  email = Faker::Internet.email
  role = %w[manager admin member].sample  
  phone_number = Faker::PhoneNumber.cell_phone
  password = "james"

  Employee.create!(
    firstname: firstname,
    lastname: lastname,
    business_name: business_name,
    email: email,
    role: role,
    phone_number: phone_number,
    password: password,
    password_confirmation: password
  )
end

# Seed Suppliers
puts "Seeding Suppliers"
5.times do
  company_name = Faker::Company.name
  firstname = Faker::Name.first_name
  lastname = Faker::Name.last_name
  phone_number = Faker::PhoneNumber.phone_number
  email = Faker::Internet.email

  Supplier.create!(
    company_name: company_name,
    firstname: firstname,
    lastname: lastname,
    phone_number: phone_number,
    email: email
  )
end

category_names = [
  'Engine',
  'Transmission',
  'Brakes',
  'Suspension',
  'Electrical',
  'Cooling',
  'Exhaust',
  'Body',
  'Interior',
  'Miscellaneous'
]

# Create categories
category_names.each do |category_name|
  Category.create(category_name: category_name)
end

puts "Done Seeding"
