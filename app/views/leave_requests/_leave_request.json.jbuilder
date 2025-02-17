json.extract! leave_request, :id, :employee_id, :status, :approver_id, :date_from, :date_to, :created_at, :updated_at
json.url leave_request_url(leave_request, format: :json)
