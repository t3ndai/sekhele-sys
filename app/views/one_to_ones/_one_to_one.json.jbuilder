json.extract! one_to_one, :id, :employee_id, :manager_id, :note, :created_at, :updated_at
json.url one_to_one_url(one_to_one, format: :json)
