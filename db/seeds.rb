# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


p "Creating roles"
# p "Removing initial roles - #{Role.all.count}"
# Role.destroy_all
[ "superadmin", "org_admin", "hr_admin", "payroll_admin", "it_admin", "manager", "dept_head" ].each do |role|
  Role.find_or_create_by(name: role)
end
p "Created #{Role.all.count} roles"

p "Creating 50 employees"
50.times do
  Employee.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    dob: Faker::Date.birthday(min_age: 18, max_age: 65),
    addr_line1: Faker::Address.building_number,
    addr_line2: Faker::Address.street_name,
    addr_line3: Faker::Address.community,
    city: Faker::Address.city,
    country: Faker::Address.country_by_code(code: "ZW"),
    phone1: Faker::PhoneNumber.cell_phone_in_e164,
    personal_email: Faker::Internet.email,
    work_email: Faker::Internet.email(domain: 'cut.ac.zw'),
    id_number: Faker::IdNumber.chilean_id,
    nationality: Faker::Address.country_by_code(code: "ZW"),
    employement_id: Faker::Number.number(digits: 5),
    hire_date: Faker::Date.between(from: 5.years.ago, to: Date.today),
    organization_id: 1,
    gender: Faker::Number.between(from: 0, to: 1)
  )
end
p "Created 50 employees"
