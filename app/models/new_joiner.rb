# == Schema Information
#
# Table name: new_joiners
#
#  id               :integer          not null, primary key
#  start_date       :date
#  manager_id       :integer
#  job_applicant_id :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_new_joiners_on_job_applicant_id  (job_applicant_id)
#  index_new_joiners_on_manager_id        (manager_id)
#

class NewJoiner < ApplicationRecord
  belongs_to :manager, class_name: "Employee"
  belongs_to :job_applicant

  has_many :onboarding_events
  has_many :onboard_checklists

  validates :start_date, presence: true

  def as_json(options = {})
    super(options).tap do |hash|
      hash["name"] = job_applicant.full_name
    end
  end
end
