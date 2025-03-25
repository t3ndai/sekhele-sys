class EmployeeDashboardController < ApplicationController
  def show
    @leave_balances = current_employee.leave_policies.map do |leave_policy|
      { name: leave_policy.name,
      balance: LeaveBalance.employee_balance(employee: current_employee, leave_policy: leave_policy).leave_remaining,
      expires: leave_policy.valid_to.strftime("%e %b %Y"),
      category: leave_policy.leave_category.name
    }
  end
    @tasks = current_employee.tasks.map do |task|
      { title: task.title,
      assigned_on: task.created_at.strftime("%e %b %Y"),
      assigned_by: task.assigned_by.full_name,
      due_on: task.due_on.strftime("%e %b %Y"),
      status: task.status.humanize
      }
    end
    puts @tasks
    render inertia: "EmployeeDashboard/Show", props: {
      leave_balances: @leave_balances, tasks: @tasks }
  end
end
