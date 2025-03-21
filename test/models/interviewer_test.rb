# == Schema Information
#
# Table name: interviewers
#
#  id           :integer          not null, primary key
#  interview_id :integer          not null
#  employee_id  :integer          not null
#  assigned_on  :date
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_interviewers_on_employee_id   (employee_id)
#  index_interviewers_on_interview_id  (interview_id)
#

require "test_helper"

class InterviewerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
