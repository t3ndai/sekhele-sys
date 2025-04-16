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
    render inertia: 'HrAdmin/Index', props: {employees: }
  end
end
