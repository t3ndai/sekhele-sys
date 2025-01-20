json.extract! employee, :id, :first_name, :last_name, :dob, :addr_line1, :addr_line2, :addr_line3, :addr_postcode, :city, :country, :phone1, :phone2, :personal_email, :work_email, :id_number, :nationality, :passport_number, :hire_date, :employement_id, :preferred_name, :created_at, :updated_at
json.url employee_url(employee, format: :json)
