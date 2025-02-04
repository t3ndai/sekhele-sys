json.extract! employee_file, :id, :file, :document_id, :employee_id, :created_at, :updated_at
json.url employee_file_url(employee_file, format: :json)
json.file url_for(employee_file.file)
