class Interview < ApplicationRecord
  belongs_to :interview_stage
  belongs_to :job_applicant

  validates :interview_on, presence: true
  validates :interview_on, timeliness: { on_or_after: -> { Date.current }, type: :date }
  validates :interview_at, presence: true
end
