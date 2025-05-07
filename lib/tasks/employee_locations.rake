desc "Seed Development Database with Locations and assign to employees"
task seed_employee_locations: :environment do
  p "Create Locations"
  organization = Organization.find(1)
  locations = ["Harare", "Gweru", "Bulawayo", "Kampala", "Lusaka", "Pretoria"]
  4.times do
    Location.create(name: locations.sample, organization: organization, addr_line1: Faker::Address.street_address, city: Faker::Address.city, country: Faker::Address.country_by_code(code: "ZW"))
  end
  p "Created new locations - now #{Location.all.count}"
  organization.employees.each do |employee|
    EmployeeLocation.create(employee: employee, location: Location.all.sample(1).first, date_from: Faker::Date.between(from: 5.years.ago, to: Date.today))
  end
end
p "Created Locations and Assigned to Employees"
