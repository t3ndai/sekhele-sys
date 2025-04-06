class ReportsController < ApplicationController
  def index
    reports = @current_employee.reports.map do |report|
      {
        id: report.id,
        name: report.full_name
      }
    end if @current_employee.is_manager?
    render inertia: "Reports/Index", props: {
      reports:
    }
  end

  def goals
    report = Employee.find(params[:report_id])
    goals = report.goals.map do |goal|
      {
        id: goal.id,
        name: goal.name,
        starts_on: goal.starts_on.strftime("%d-%b"),
        ends_on: goal.ends_on.strftime("%d-%b"),
        milestones: goal.milestones.map do |milestone|
          {
            id: milestone.id,
            name: milestone.name,
            completed_on: milestone.completed_on&.strftime("%d-%b"),
            started_on: milestone.started_on&.strftime("%d-%b"),
            description: milestone.description.body.to_plain_text
          }
        end
      }
    end

    render inertia: "Reports/Goals", props: {
      report: {
        id: report.id,
        name: report.full_name
      },
      goals:
    }
  end
end
