json.extract! benefit_plan, :id, :benefit_id, :name, :employer_contribution, :employee_contribution, :cover, :documents, :created_at, :updated_at
json.url benefit_plan_url(benefit_plan, format: :json)
json.documents do
  json.array!(benefit_plan.documents) do |document|
    json.id document.id
    json.url url_for(document)
  end
end
