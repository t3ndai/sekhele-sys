# == Schema Information
#
# Table name: emergency_contacts
#
#  id          :integer          not null, primary key
#  employee_id :integer          not null
#  first_name  :string
#  last_name   :string
#  phone1      :string
#  phone2      :string
#  addr_line1  :string
#  addr_line2  :string
#  addr_lin3   :string
#  city        :string
#  postcode    :string
#  country     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_emergency_contacts_on_employee_id  (employee_id)
#

require "test_helper"

class EmergencyContactTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
