class PeopleController < ApplicationController
  include ActionView::Helpers::DateHelper
  def index
    people = @current_employee.organization.employees.map do |employee|
      {
        id: employee.id,
        full_name: employee.full_name,
        tenure: distance_of_time_in_words_to_now(employee.hire_date, only: [ :years, :months, :days ]),
        manager: employee.manager&.full_name,
        job_title: employee.employee_jobs.active_jobs.first&.job_function&.title,
        job_level: employee.job_levels.first&.name,
        department: employee.employee_jobs.active_jobs.first&.job_function&.department&.name,
        location: employee.employee_locations.current.first&.location&.name
      }
    end
    render inertia: "People/Index", props: {
      people:
    }
  end
end
