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

class Goal < ApplicationRecord
  belongs_to :employee
  belongs_to :manager, class_name: "Employee"

  has_many :milestones, dependent: :destroy


  validates_uniqueness_of :name, scope: :employee_id
  validates_presence_of :name, :employee_id, :manager_id, :starts_on, :ends_on
  validates_date :starts_on, :ends_on, timeliness: { on_or_after: Date.current }
  validates :ends_on, timeliness: { on_or_after: :starts_on }
end
