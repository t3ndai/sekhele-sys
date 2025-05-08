desc "Create Sample Benefits"
task seed_benefits: :environment do
  p "Ceating Benefits"
  valuation_types = [ "taxable", "non_taxable" ]
  organization = Organization.find(1)
  organization.benefit_types.all.map do |benefit_type|
    p "#{benefit_type.name}"
    Benefit.find_or_create_by(organization: organization, benefit_type: benefit_type, name: "2025-#{benefit_type.name}", valuation_type: valuation_types.sample)
  end
  p "Created Benefits"
end
