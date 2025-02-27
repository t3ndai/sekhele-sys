json.extract! job_posting, :id, :organization_id, :num_positions, :date_open, :date_close, :created_at, :updated_at
json.url job_posting_url(job_posting, format: :json)
