json.extract! milestone, :id, :goal_id, :name, :description, :completed_on, :evidence, :started_on, :created_at, :updated_at
json.url milestone_url(milestone, format: :json)
json.evidence do
  json.array!(milestone.evidence) do |evidence|
    json.id evidence.id
    json.url url_for(evidence)
  end
end
