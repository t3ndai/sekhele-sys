# == Schema Information
#
# Table name: employees
#
#  id              :integer          not null, primary key
#  first_name      :string           not null
#  last_name       :string           not null
#  dob             :date             not null
#  addr_line1      :string
#  addr_line2      :string
#  addr_line3      :string
#  addr_postcode   :string
#  city            :string           not null
#  country         :string           not null
#  phone1          :string           not null
#  phone2          :string
#  personal_email  :string           not null
#  work_email      :string           not null
#  id_number       :string           not null
#  nationality     :string           not null
#  passport_number :string
#  hire_date       :date             not null
#  employment_id   :string
#  preferred_name  :string
#  organization_id :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  gender          :integer
#  manager_id      :integer
#
# Indexes
#
#  index_employees_on_manager_id       (manager_id)
#  index_employees_on_organization_id  (organization_id)
#

require "test_helper"

class EmployeeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
