class HrAdminController < ApplicationController
  include ActionView::Helpers::DateHelper
  def index
    employees = @current_employee.organization.employees.map do |employee| {
      id: employee.id,
      first_name: employee.first_name,
      last_name: employee.last_name,
      full_name: employee.full_name,
      addr_line1: employee.addr_line1,
      addr_line2: employee.addr_line2,
      addr_postcode: employee.addr_postcode,
      city: employee.city,
      country: employee.country,
      phone1: employee.phone1,
      phone2: employee.phone2,
      personal_email: employee.personal_email,
      work_email: employee.work_email,
      id_number: employee.id_number,
      hire_date: employee.hire_date.strftime("%e %b %Y"),
      dob: employee.dob.strftime("%e %b %Y"),
      employment_id: employee.employment_id,
      preferred_name: employee.preferred_name,
      gender: employee.gender,
      tenure: distance_of_time_in_words_to_now(employee.hire_date, only: [ :years, :months, :days ]),
      manager: employee.manager&.full_name,
      job_title: employee.employee_jobs.active_jobs.first&.job_function&.title,
      job_level: employee.job_levels.first&.name,
      department: employee.employee_jobs.active_jobs.first&.job_function&.department&.name,
      location: employee.employee_locations.current.first&.location&.name
    }
    end
    benefits = @current_employee.organization.benefits.map do |benefit|
      {
        id: benefit.id,
        name: benefit.name,
        type: benefit.benefit_type.name.humanize,
        valuation_type: benefit.valuation_type.humanize
      }
    end
    benefit_types = @current_employee.organization.benefit_types.map do |benefit_type|
      {
        id: benefit_type.id,
        name: benefit_type.name.humanize
      }
    end

    asset_categories = @current_employee.organization.asset_categories.map do |asset_category|
      {
        id: asset_category.id,
        name: asset_category.name
      }
    end

    assets = @current_employee.organization.assets.map do |asset|
      {
        id: asset.id,
        name: asset.name,
        category: asset.asset_category.name.humanize,
        serial_number: asset.serial_number,
        status: asset.status
      }
    end

    departments = @current_employee.organization.departments.map do |department|
      {
        id: department.id,
        name: department.name
      }
    end

    locations = @current_employee.organization.locations.map do |location|
      {
        id: location.id,
        name: location.name,
        address: "#{location.addr_line1}, #{location.addr_line2}, #{location.addr_line3}",
        city: location.city,
        country: location.country
      }
    end

    job_functions = @current_employee.organization.job_functions.map do |job_function|
      {
       id: job_function.id,
       title: job_function.title,
       department: job_function.department&.name,
       salary_range: job_function.salary_range
      }
    end

    job_levels = @current_employee.organization.job_levels.map do |job_level|
      {
        name: job_level.name,
        job_function: job_level.job_function.title,
        salary_range: job_level.salary_range
      }
    end

    leave_categories = @current_employee.organization.leave_categories.map do |leave_category|
      {
        id: leave_category.id,
        name: leave_category.name.humanize,

      }
    end

    leave_policies = @current_employee.organization.leave_policies.map do |leave_policy|
      {
        id: leave_policy.id,
        name: leave_policy.name,
        start_balance: leave_policy.start_balance,
        category: leave_policy.leave_category.name.humanize,
        valid_from: leave_policy.valid_from.strftime('%e-%b-%Y'),
        valid_to: leave_policy.valid_to.strftime("%e-%b-%Y")
      }
    end

    documents = @current_employee.organization.documents.map do |document|
      {
        id: document.id,
        name: document.name,
        type: document.document_type.humanize,
      }
    end

    company_files = @current_employee.organization.company_files.map do |company_file|
      {
        id: company_file.id,
        name: company_file.name,
        url: rails_blob_url(company_file.file, only_path: true)
      }
    end

    company_docs = @current_employee.organization.documents.company_docs.map do |doc|
      {
        id: doc.id,
        name: doc.name,
      }
    end

    interview_stages = @current_employee.organization.interview_stages.map do |interview_stage|
      {
        id: interview_stage.id,
        name: interview_stage.name,
        stage_type: interview_stage.stage_type.humanize,
        mandatory: interview_stage.mandatory.humanize
      }
    end

    stage_types = InterviewStage.stage_types.keys.map do |stage_type|
      {
        name: stage_type.humanize,
        value: stage_type
      }
    end

    performance_reviews = @current_employee.organization.performance_reviews.map do |performance_review|
      {
        id: performance_review.id,
        name: performance_review.name,
        type: performance_review.performance_review_type.name.humanize,
        opens_on: performance_review.opens_on.strftime("%e-%b-%Y"),
        closes_on: performance_review.closes_on.strftime("%e-%b-%Y")
      }
    end

    performance_review_types = PerformanceReviewType.all.map do |review_type|
      {
        id: review_type.id,
        name: review_type.name.humanize
      }
    end

    pulse_surveys = @current_employee.organization.pulse_surveys.map do |pulse_survey|
      {
        id: pulse_survey.id,
        name: pulse_survey.name,
        date_open: pulse_survey.date_open,
        date_close: pulse_survey.date_close
      }
    end

    render inertia: "HrAdmin/Index", props: { employees:, benefits:, benefit_types:,
      asset_categories:, assets:, locations:, departments:,
      job_levels:, job_functions:, leave_categories:, leave_policies:,
      documents:, company_files:, company_docs:, interview_stages:,
      stage_types:, performance_reviews:, performance_review_types:,
      pulse_surveys:,
    }
  end


  def detailed_view
    @employee = Employee.find(params[:employee_id])
    employee = {
      id: @employee.id,
      first_name: @employee.first_name,
      last_name: @employee.last_name,
      preferred_name: @employee.preferred_name,
      full_name: @employee.full_name,
      addr_line1: @employee.addr_line1,
      addr_line2: @employee.addr_line2,
      addr_postcode: @employee.addr_postcode,
      city: @employee.city,
      country: @employee.country,
      phone1: @employee.phone1,
      phone2: @employee.phone2,
      personal_email: @employee.personal_email,
      work_email: @employee.work_email,
      id_number: @employee.id_number,
      passport_number: @employee.passport_number,
      hire_date: @employee.hire_date.strftime("%e %b %Y"),
      dob: @employee.dob.strftime("%e %b %Y"),
      employment_id: @employee.employment_id,
      preferred_name: @employee.preferred_name,
      gender: @employee.gender.humanize,
      tenure: distance_of_time_in_words_to_now(@employee.hire_date, only: [ :years, :months, :days ]),
      manager: @employee.manager&.full_name,
      job_title: @employee.employee_jobs.active_jobs.first&.job_function&.title,
      job_level: @employee.job_levels.first&.name,
      department: @employee.employee_jobs.active_jobs.first&.job_function&.department&.name,
      location: @employee.employee_locations.current.first&.location&.name
    }

    benefits = @employee.benefit_elections.map do |benefit_election|
      {
        id: benefit_election.id,
        benefit_plan: benefit_election.benefit_plan.name,
        cover: benefit_election.benefit_plan.cover,
        employee_contribution: benefit_election.benefit_plan.employee_contribution,
        employer_contribution: benefit_election.benefit_plan.employer_contribution,
        benefit: benefit_election.benefit_plan.benefit.name,
        benefit_type: benefit_election.benefit_plan.benefit.benefit_type.name,
        valuation: benefit_election.benefit_plan.benefit.valuation_type.humanize
      }
    end

    assets = @employee.org_assets.map do |asset|
      {
        id: asset.id,
        category: asset.asset_category.name,
        date_given: asset.date_given&.strftime("%e %b %Y"),
        date_returned: asset.date_returned&.strftime("%e %b %Y"),
        name: asset.asset_name,
        serial_number: asset.asset_serial_number
      }
    end

    jobs = @employee.employee_jobs.map do |job|
      {
       id: job.id,
       title: job.job_function.title,
       level: job.job_level.name,
       started_on: job.started_on&.strftime("%e %b %Y"),
       ended_on: job.ended_on&.strftime("%e %b %Y")
      }
    end

    past_leaves = @employee.leave_requests.past_leave.map do |leave|
      {
        leave_type: leave.leave_policy.leave_category.name.humanize,
        date_from: leave.date_from,
        date_to: leave.date_to,
        reason: leave.reason,
        duration: leave.time_requested,
        status: leave.status.humanize
      }
    end

    future_leaves = @employee.leave_requests.future_leave.map do |leave|
      {
        leave_type: leave.leave_policy.leave_category.name.humanize,
        date_from: leave.date_from,
        date_to: leave.date_to,
        duration: leave.time_requested,
        reason: leave.reason,
        status: leave.status.humanize
      }
    end

    leave_balances = @employee.leave_balances.map do |leave_balance|
      {
        id: leave_balance.id,
        name: leave_balance.leave_policy.name,
        valid_from: leave_balance.leave_policy.valid_from.strftime("%e %b %Y"),
        valid_to: leave_balance.leave_policy.valid_to.strftime("%e %b %Y"),
        balance: leave_balance.leave_remaining,
        category: leave_balance.leave_policy.leave_category.name
      }
    end

    documents = @employee.employee_files.map do |doc|
      {
        id: doc.id,
        name: doc.name,
        type: doc.document.name,
        url: rails_blob_url(doc.file, only_path: true)
      }
    end

    performance_reviews = PerformanceReviewResponse.reviews(@employee).map do |review|
      {
        id: review.id,
        reviewer: review.reviewer.full_name,
        type: review.performance_review.performance_review_type.name.humanize,
        answers: review.performance_review_answers.map do |answer|
          {
            question: answer.performance_review_question.title,
            answer: answer.answer
          }
        end
      }
    end

    render inertia: "HrAdmin/EmployeeView", props: { employee:, benefits:, assets:, jobs:, past_leaves:, future_leaves:, leave_balances:, documents:, performance_reviews: }
  end
end
