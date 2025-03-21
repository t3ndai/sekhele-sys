# == Schema Information
#
# Table name: goals
#
#  id          :integer          not null, primary key
#  employee_id :integer          not null
#  manager_id  :integer          not null
#  name        :string
#  starts_on   :date
#  ends_on     :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_goals_on_employee_id  (employee_id)
#  index_goals_on_manager_id   (manager_id)
#

require "test_helper"

class GoalTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
