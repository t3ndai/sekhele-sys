json.extract! task, :id, :assigned_by_id, :assignee_id, :due_on, :status, :notes, :files, :created_at, :updated_at
json.url task_url(task, format: :json)
json.files do
  json.array!(task.files) do |file|
    json.id file.id
    json.url url_for(file)
  end
end
