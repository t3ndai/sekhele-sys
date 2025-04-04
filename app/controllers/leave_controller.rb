class LeaveController < ApplicationController
  def index
    past_leaves = @current_employee.leave_requests.past_leave.map do |leave|
      {
        leave_type: leave.leave_policy.leave_category.name.humanize,
        date_from: leave.date_from,
        date_to: leave.date_to,
        reason: leave.reason,
        duration: leave.time_requested,
        status: leave.status.humanize
      }
    end
    future_leaves = @current_employee.leave_requests.future_leave.map do |leave|
      {
        leave_type: leave.leave_policy.leave_category.name.humanize,
        date_from: leave.date_from,
        date_to: leave.date_to,
        duration: leave.time_requested,
        reason: leave.reason,
        status: leave.status.humanize
      }
    end

    leave_policies = @current_employee.leave_policies.map do |leave_policy|
      {
        id: leave_policy.id,
        name: leave_policy.name
      }
    end

    render inertia: "Leave/Index", props: {
      past_leaves:, future_leaves:, leave_policies:
    }
  end
end
