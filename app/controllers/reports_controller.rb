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

  def career
    report = Employee.find(params[:report_id])
    career_visions = report.career_visions.map do |vision|
      {
        id: vision.id,
        name: vision.name,
        description: vision.description,
        outline: vision.outline.humanize
      }
    end
    motivations = report.motivations.map do |motivation|
      {
        id: motivation.id,
        name: motivation.name,
        description: motivation.description.body.to_plain_text
      }
    end

    render inertia: "Reports/Career", props: {
      report: {
        id: report.id,
        name: report.full_name
      },
      career_visions:,
      motivations:
    }
  end

  def new_downward_performance_review
    report = Employee.find(params[:report_id])
    puts report.id
    performance_review_response = PerformanceReviewResponse.incomplete(report).active.first

    review_response =
      {
        id: performance_review_response.id,
        title: performance_review_response.performance_review.name,
        response: performance_review_response.response
      } if performance_review_response

    puts review_response.inspect
    questions = PerformanceReviewType.downward.first.performance_review_questions
    response = review_response[:response] || questions.map do |question|
      {
        question: question.title,
        answer: ""
      }

    end
    render inertia: "Reports/NewPerformanceReview", props: {
      report: {
        id: report.id,
        name: report.full_name,
      },
      response:,
      review_response:,
    }
  end
end
