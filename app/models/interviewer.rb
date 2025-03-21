# == Schema Information
#
# Table name: interviewers
#
#  id           :integer          not null, primary key
#  interview_id :integer          not null
#  employee_id  :integer          not null
#  assigned_on  :date
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_interviewers_on_employee_id   (employee_id)
#  index_interviewers_on_interview_id  (interview_id)
#

class Interviewer < ApplicationRecord
  belongs_to :interview
  belongs_to :employee

  validates_uniqueness_of :employee_id, scope: :interview_id
end
