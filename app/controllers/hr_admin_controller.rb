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
      job_title: employee.employee_jobs.active_jobs.first.job_function.title,
      job_level: employee.job_levels.first.name,
      department: employee.employee_jobs.active_jobs.first.job_function.department&.name,
      location: employee.employee_locations.current.first.location.name
    }
    end
    render inertia: "HrAdmin/Index", props: { employees: }
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
      job_title: @employee.employee_jobs.active_jobs.first.job_function.title,
      job_level: @employee.job_levels.first.name,
      department: @employee.employee_jobs.active_jobs.first.job_function.department&.name,
      location: @employee.employee_locations.current.first.location.name
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

    render inertia: "HrAdmin/EmployeeView", props: { employee:, benefits:, assets:, jobs: }
  end
end
