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

class Task < ApplicationRecord
  belongs_to :assigned_by, class_name: "Employee"
  belongs_to :assignee, class_name: "Employee", foreign_key: "assignee_id"
  has_many_attached :files

  validates :due_on, presence: true, timeliness: { on_or_after: -> { Date.current }, type: :date }
  validates :notes, :title, presence: true

  enum :status, { up_next: "up_next", in_progress: "in_progress", completed: "completed" }, default: :up_next
end
