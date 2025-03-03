class InterviewFeedback < ApplicationRecord
  belongs_to :interview
  belongs_to :interviewer

  has_rich_text :notes

  validates :notes, presence: true
  enum :status, { strong_no: "strong_no", no: "no", maybe: "maybe", yes: "yes", strong_yes: "strong_yes" }, validate: { allow_nil: false }
end
