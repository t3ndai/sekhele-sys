# == Schema Information
#
# Table name: leave_requests
#
#  id              :integer          not null, primary key
#  employee_id     :integer          not null
#  leave_policy_id :integer          not null
#  status          :string
#  date_from       :date
#  date_to         :date
#  reason          :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_leave_requests_on_employee_id      (employee_id)
#  index_leave_requests_on_leave_policy_id  (leave_policy_id)
#

require "test_helper"

class LeaveRequestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
