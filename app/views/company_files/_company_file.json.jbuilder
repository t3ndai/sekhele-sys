json.extract! company_file, :id, :name, :document_id, :organization_id, :file, :created_at, :updated_at
json.url company_file_url(company_file, format: :json)
json.file url_for(company_file.file)
