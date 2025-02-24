json.extract! benefit_election, :id, :employee_id, :benefit_plan_id, :selected_on, :documents, :created_at, :updated_at
json.url benefit_election_url(benefit_election, format: :json)
json.documents do
  json.array!(benefit_election.documents) do |document|
    json.id document.id
    json.url url_for(document)
  end
end
