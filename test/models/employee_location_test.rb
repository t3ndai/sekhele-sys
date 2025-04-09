# == Schema Information
#
# Table name: employee_locations
#
#  id          :integer          not null, primary key
#  employee_id :integer          not null
#  location_id :integer          not null
#  date_from   :date
#  date_to     :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_employee_locations_on_employee_id  (employee_id)
#  index_employee_locations_on_location_id  (location_id)
#

require "test_helper"

class EmployeeLocationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
