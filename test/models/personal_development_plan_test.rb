# == Schema Information
#
# Table name: personal_development_plans
#
#  id          :integer          not null, primary key
#  employee_id :integer          not null
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_personal_development_plans_on_employee_id  (employee_id)
#

require "test_helper"

class PersonalDevelopmentPlanTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
