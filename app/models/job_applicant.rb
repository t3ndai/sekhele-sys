class JobApplicant < ApplicationRecord
  belongs_to :job_posting
  has_one_attached :cv
  has_many_attached :other_docs

  has_many :candidate_notes, dependent: :destroy
  has_many :interviews, dependent: :destroy


  validates :first_name, :last_name, :email, :phone, :cv, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_uniqueness_of :email, scope: :job_posting_id

  # TODO
  # craete a method to send email to the job_applicant owner
end
