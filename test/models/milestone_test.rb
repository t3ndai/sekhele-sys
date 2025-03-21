# == Schema Information
#
# Table name: milestones
#
#  id           :integer          not null, primary key
#  goal_id      :integer          not null
#  name         :string
#  completed_on :date
#  started_on   :date
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_milestones_on_goal_id  (goal_id)
#

require "test_helper"

class MilestoneTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
