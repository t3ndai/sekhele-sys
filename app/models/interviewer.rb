class Interviewer < ApplicationRecord
  belongs_to :interview
  belongs_to :employee

  validates_uniqueness_of :employee_id, scope: :interview_id
end
