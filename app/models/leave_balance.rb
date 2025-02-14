class LeaveBalance < ApplicationRecord
  belongs_to :employee
  belongs_to :leave_policy

  validates_uniqueness_of :employee_id, scope: :leave_policy_id, message: "Leave Policy Already Applied"
end
