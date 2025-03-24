class EmployeeDashboardController < ApplicationController
  def show
    @leave_balances = current_employee.leave_policies.map do |leave_policy|
      { name: leave_policy.name,
      balance: LeaveBalance.employee_balance(employee: current_employee, leave_policy: leave_policy).leave_remaining,
      expires: leave_policy.valid_to.strftime("%e %b %Y"),
      category: leave_policy.leave_category.name
    }
    end
    render inertia: "EmployeeDashboard/Show", props: {
      leave_balances: @leave_balances }
  end
end
