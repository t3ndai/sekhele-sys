# == Schema Information
#
# Table name: interview_feedbacks
#
#  id             :integer          not null, primary key
#  interview_id   :integer          not null
#  interviewer_id :integer          not null
#  status         :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_interview_feedbacks_on_interview_id    (interview_id)
#  index_interview_feedbacks_on_interviewer_id  (interviewer_id)
#

class InterviewFeedback < ApplicationRecord
  belongs_to :interview
  belongs_to :interviewer

  has_rich_text :notes

  validates :notes, presence: true
  enum :status, { strong_no: "strong_no", no: "no", maybe: "maybe", yes: "yes", strong_yes: "strong_yes" }, validate: { allow_nil: false }
end
