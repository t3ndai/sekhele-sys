desc "Seed Development Database with Employees"
task seed_employees: :environment do
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
    work_email: Faker::Internet.email(domain: "bigbank.co.zw"),
    id_number: Faker::IdNumber.chilean_id,
    nationality: Faker::Address.country_by_code(code: "ZW"),
    employment_id: Faker::Number.number(digits: 5),
    hire_date: Faker::Date.between(from: 5.years.ago, to: Date.today),
    organization_id: 1,
    gender: Faker::Number.between(from: 0, to: 1)
  )
end
p "Created 50 employees"
end
