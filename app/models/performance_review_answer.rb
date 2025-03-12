class PerformanceReviewAnswer < ApplicationRecord
  belongs_to :performance_review_response
  belongs_to :performance_review_question

  validates :answer, presence: true
  validates :performance_review_question_id, uniqueness: { scope: :performance_review_response_id }
end
