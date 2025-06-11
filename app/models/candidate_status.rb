# == Schema Information
#
# Table name: candidate_statuses
#
#  id               :integer          not null, primary key
#  job_applicant_id :integer          not null
#  status           :string
#  reason           :text
#  status_by_id     :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_candidate_statuses_on_job_applicant_id  (job_applicant_id) UNIQUE
#  index_candidate_statuses_on_status_by_id      (status_by_id)
#

class CandidateStatus < ApplicationRecord
  belongs_to :job_applicant
  belongs_to :status_by, class_name: "Employee"
  has_one_attached :reason_doc
  has_one_attached :offer_letter
  has_one_attached :offer_letter_signed

  enum :status, { rejected: "rejected", offer: "offer", offer_sent: "offer_sent", offer_accepted: "offer_accepted", offer_rejected: "offer_rejected" }, allow_nil: false

  validates :reason, presence: true if :reason_doc.blank?
  validates :status, presence: true
  validates :reason_doc, content_type: [ :pdf ], size: { less_than: 5.megabytes }, presence: true, unless: -> { reason.present? || status == "offer_sent" || status == "offer_accepted" || status == "offer_rejected" }
  validates :offer_letter, content_type: [ :pdf ], size: { less_than: 5.megabytes }, presence: true, if: -> { status == "offer_sent" }

  def status_by_name
    status_by.full_name
  end
end
