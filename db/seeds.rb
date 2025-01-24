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
p "Removing initial roles - #{Role.all.count}"
Role.destroy_all
[ "superadmin", "org_admin", "hr_admin", "payroll_admin", "it_admin", "manager", "dept_head" ].each do |role|
  Role.create!(name: role)
end
p "Created #{Role.all.count} roles"
