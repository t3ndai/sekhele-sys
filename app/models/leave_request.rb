# == Schema Information
#
# Table name: leave_requests
#
#  id              :integer          not null, primary key
#  employee_id     :integer          not null
#  leave_policy_id :integer          not null
#  status          :string
#  date_from       :date
#  date_to         :date
#  reason          :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_leave_requests_on_employee_id      (employee_id)
#  index_leave_requests_on_leave_policy_id  (leave_policy_id)
#

class LeaveRequest < ApplicationRecord
  belongs_to :employee
  belongs_to :leave_policy
  belongs_to :approver, optional: true

  validate :validate_enough_leave
  validates :date_from, :date_to, presence: true

  enum :status, { pending: "pending", approved: "approved" }, default: :approved

  after_create :reduce_leave_balance

  scope :past_leave, -> {
    where("date_to < ?", Date.today)
  }

  scope :future_leave, -> {
    where("date_from > ?", Date.today)
  }


  def leave_balance
    LeaveBalance.employee_balance(employee: employee, leave_policy: leave_policy)
  end

  def approver_name
    approver&.full_name
  end

  def approver_email
    approver&.email
  end

  def time_requested
    date_from.business_days_until(date_to)
  end

  private


  def reduce_leave_balance
    @leave_balance.time_taken += time_requested
    @leave_balance.save!
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
