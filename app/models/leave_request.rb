class LeaveRequest < ApplicationRecord
  belongs_to :employee
  belongs_to :leave_policy
  belongs_to :approver, optional: true

  validate :validate_enough_leave
  validates :date_from, :date_to, presence: true

  enum :status, { pending: "pending", approved: "approved" }, default: :approved

  after_create :reduce_leave_balance


  def reduce_leave_balance
    @leave_balance.time_taken += time_requested
    @leave_balance.save!
  end

  def time_requested
    date_from.business_days_until(date_to)
  end

  def validate_enough_leave
    @leave_balance = LeaveBalance.employee_balance(employee: employee, leave_policy: leave_policy)
    unless @leave_balance.has_enough_leave?(time_requested)
      errors.add :base, :invalid, message: "Not enough leave balance"
    end
  end

  def validate_requested_dates
    unless date_to.after?(date_from)
      errors.add(:date_to, "End date must be after Beginning Date")
    end
  end

  # after create update leave_balance_time_taken
end
