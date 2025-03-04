class Goal < ApplicationRecord
  belongs_to :employee
  belongs_to :manager, class_name: "Employee"


  validates_uniqueness_of :name, scope: :employee_id
  validates_presence_of :name, :employee_id, :manager_id, :starts_on, :ends_on
  validates_date :starts_on, :ends_on, timeliness: { on_or_after: Date.current }
  validates :ends_on, timeliness: { on_or_after: :starts_on }
end
