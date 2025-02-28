json.extract! interview, :id, :interview_stage_id, :on, :at, :meeting_link, :room, :location, :job_applicant_id, :note, :created_at, :updated_at
json.url interview_url(interview, format: :json)
