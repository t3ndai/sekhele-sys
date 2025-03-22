# == Schema Information
#
# Table name: tasks
#
#  id             :integer          not null, primary key
#  assigned_by_id :integer          not null
#  assignee_id    :integer          not null
#  title          :string
#  due_on         :date
#  status         :string
#  notes          :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_tasks_on_assigned_by_id  (assigned_by_id)
#  index_tasks_on_assignee_id     (assignee_id)
#

require "test_helper"

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
