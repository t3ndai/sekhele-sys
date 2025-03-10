json.extract! performance_review, :id, :performance_review_type_id, :opens_on, :closes_on, :name, :organization_id, :created_at, :updated_at
json.url performance_review_url(performance_review, format: :json)
