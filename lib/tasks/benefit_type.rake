desc "Create Sample Benefit Types"
task seed_benefit_types: :environment do
p "Create Benefit Types"
organization = Organization.find(1)
[ "Vehicle", "Holiday", "School Fees" ].each do |benefit|
  BenefitType.find_or_create_by(organization: organization, name: benefit)
end
p "Created Benefit Types"
end
