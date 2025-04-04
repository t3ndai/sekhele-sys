class MyStuffController < ApplicationController
  include ActionView::Helpers::DateHelper
  def index
    assets = @current_employee.org_assets.map do |asset|
      {
        id: asset.id,
        name: asset.asset_name,
        category: asset.asset_category.name,
        serial_number: asset.asset_serial_number,
        assigned_on: asset.date_given,
        returned_on: asset.date_returned
      }
    end
    docs = @current_employee.employee_files.map do |doc|
      {
          id: doc.id,
          name: doc.name,
          type: doc.document.name,
          url: rails_blob_url(doc.file, only_path: true)
      }
    end
    details = {
      id: @current_employee.id,
      first_name: @current_employee.first_name,
      last_name: @current_employee.last_name,
      dob: @current_employee.dob,
      city: @current_employee.city,
      personal_email: @current_employee.personal_email,
      work_email: @current_employee.work_email,
      id_number: @current_employee.id_number,
      phone1: @current_employee.phone1,
      hire_date: @current_employee.hire_date,
      tenure: time_ago_in_words(@current_employee.hire_date),
      addr_line1: @current_employee.addr_line1,
      addr_line2: @current_employee.addr_line2,
      addr_line3: @current_employee.addr_line3,
      addr_postcode: @current_employee.addr_postcode,
      nationality: @current_employee.nationality,
      manager: @current_employee.manager&.full_name
    }

    render inertia: "MyStuff/Index", props: {
      assets:, docs:, details:
    }
  end
end
