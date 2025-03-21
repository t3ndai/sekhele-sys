# == Schema Information
#
# Table name: job_functions
#
#  id              :integer          not null, primary key
#  title           :string
#  department_id   :integer
#  organization_id :integer          not null
#  salary_range    :numrange
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_job_functions_on_department_id    (department_id)
#  index_job_functions_on_organization_id  (organization_id)
#

require "test_helper"

class JobFunctionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
