# == Schema Information
#
# Table name: job_postings
#
#  id              :integer          not null, primary key
#  organization_id :integer          not null
#  num_positions   :integer
#  title           :string
#  date_open       :date
#  date_close      :date
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_job_postings_on_organization_id  (organization_id)
#

class JobPosting < ApplicationRecord
  belongs_to :organization
  has_rich_text :description

  has_many :job_applicants, dependent: :destroy
  has_many :interviews, through: :job_applicants

  validates :title, :description, :date_open, :date_close, presence: true
  validates :num_positions, numericality: { only_integer: true, greater_than: 0 }
  validates :date_open, :date_close, timeliness: { on_or_after: Date.current }
  validates :date_close, timeliness: { on_or_after: :date_open }

  scope :active, -> { where("date_open <= ? AND date_close >= ?", Date.current, Date.current) }
  scope :org_jobs, ->(organization) { where(organization: organization) }
end
