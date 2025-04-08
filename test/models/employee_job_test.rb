# == Schema Information
#
# Table name: employee_jobs
#
#  id              :integer          not null, primary key
#  job_function_id :integer          not null
#  employee_id     :integer          not null
#  job_level_id    :integer          not null
#  started_on      :date
#  ended_on        :date
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_employee_jobs_on_employee_id      (employee_id)
#  index_employee_jobs_on_job_function_id  (job_function_id)
#  index_employee_jobs_on_job_level_id     (job_level_id)
#

require "test_helper"

class EmployeeJobTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
