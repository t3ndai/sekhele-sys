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
    @interviews = current_employee.interviews.map do |interview|
      { interviewee: interview.job_applicant.full_name,
      position: interview.job_applicant.job_posting.title,
      stage: interview.interview_stage.stage_type.humanize,
      scheduled_on: interview.interview_on.strftime("%e %b %Y"),
      scheduled_at: interview.interview_at.strftime("%l:%M %p")
      }
    end

    employees = current_employee.organization.employees
    employees = employees.map do |employee|
      { name: employee.full_name, id: employee.id }
    end

    leave_policies = current_employee.leave_policies.map do |leave_policy|
      {
        id: leave_policy.id,
        name: leave_policy.name,
      }
    end

    render inertia: "EmployeeDashboard/Show", props: {
      leave_balances: @leave_balances, tasks: @tasks,
      interviews: @interviews, employees:, leave_policies: }
  end
end
