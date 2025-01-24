json.extract! location, :id, :name, :organization_id, :addr_line1, :addr_line2, :addr_line3, :city, :country, :created_at, :updated_at
json.url location_url(location, format: :json)
