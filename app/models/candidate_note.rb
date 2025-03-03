class CandidateNote < ApplicationRecord
  belongs_to :job_applicant
  belongs_to :employee

  validates :note, presence: true
end
