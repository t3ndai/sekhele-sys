class LeaveBalance < ApplicationRecord
  belongs_to :employee
  belongs_to :leave_policy

  validates_uniqueness_of :employee_id, scope: :leave_policy_id, message: "Leave Policy Already Applied"

  # balance for employee on leave type
  def self.employee_balance(employee:, leave_policy:)
      LeaveBalance.where(employee: employee).where(leave_policy: leave_policy).first
  end

  def leave_remaining
    leave_policy.start_balance - time_taken
  end

  def has_enough_leave?(time_requested)
    if leave_remaining > time_requested
      true
    else
      false
    end
  end
end
