json.extract! job_function, :id, :title, :department_id, :organization_id, :salary_range, :created_at, :updated_at
json.url job_function_url(job_function, format: :json)
