json.extract! time_worked, :id, :start_time, :end_time, :note, :day, :employee_id, :created_at, :updated_at
json.url time_worked_url(time_worked, format: :json)
