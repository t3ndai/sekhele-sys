# == Schema Information
#
# Table name: job_applicants
#
#  id             :integer          not null, primary key
#  job_posting_id :integer          not null
#  applied_on     :date
#  first_name     :string
#  last_name      :string
#  middle_name    :string
#  email          :string
#  phone          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_job_applicants_on_job_posting_id  (job_posting_id)
#

class JobApplicant < ApplicationRecord
  belongs_to :job_posting
  has_one_attached :cv
  has_many_attached :other_docs

  has_many :candidate_notes, dependent: :destroy
  has_many :interviews, dependent: :destroy
  has_one :candidate_status


  validates :first_name, :last_name, :email, :phone, :cv, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_uniqueness_of :email, scope: :job_posting_id

  def is_org_candidate?(employee)
    true if employee.organization == job_posting.organization
  end

  generates_token_for :offer_acceptance, expires_in: 5.days do
    "#{id}-#{SecureRandom.hex(10)}"
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  # TODO
  # craete a method to send email to the job_applicant owner
end
