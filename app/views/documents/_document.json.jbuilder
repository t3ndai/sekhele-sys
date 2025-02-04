json.extract! document, :id, :name, :type, :required, :created_at, :updated_at
json.url document_url(document, format: :json)
