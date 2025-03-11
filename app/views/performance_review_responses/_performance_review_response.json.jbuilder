json.extract! performance_review_response, :id, :reviewer_id, :reviewee_id, :status, :response, :submitted_on, :performance_review_id, :created_at, :updated_at
json.url performance_review_response_url(performance_review_response, format: :json)
