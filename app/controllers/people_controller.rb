class PeopleController < ApplicationController
  include ActionView::Helpers::DateHelper
  def index
    people = @current_employee.organization.employees.map do |employee|
      {
        id: employee.id,
        full_name: employee.full_name,
        tenure: time_ago_in_words(employee.hire_date),
        manager: employee.manager&.full_name,
      }
    end
    render inertia: 'People/Index', props: {
      people:
    }
  end
end
