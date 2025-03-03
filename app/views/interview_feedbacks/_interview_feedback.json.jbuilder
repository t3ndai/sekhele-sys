json.extract! interview_feedback, :id, :interview_id, :interviewer_id, :notes, :status, :created_at, :updated_at
json.url interview_feedback_url(interview_feedback, format: :json)
