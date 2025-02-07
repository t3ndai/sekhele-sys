json.extract! emergency_contact, :id, :employee_id, :first_name, :last_name, :phone1, :phone2, :addr_line1, :addr_line2, :addr_lin3, :city, :postcode, :country, :created_at, :updated_at
json.url emergency_contact_url(emergency_contact, format: :json)
