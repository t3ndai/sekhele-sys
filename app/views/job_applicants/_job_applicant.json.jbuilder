json.extract! job_applicant, :id, :job_posting_id, :applied_on, :first_name, :last_name, :middle_name, :email, :phone, :cv, :other_docs, :created_at, :updated_at
json.url job_applicant_url(job_applicant, format: :json)
json.cv url_for(job_applicant.cv)
json.other_docs do
  json.array!(job_applicant.other_docs) do |other_doc|
    json.id other_doc.id
    json.url url_for(other_doc)
  end
end
