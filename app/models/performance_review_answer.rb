class PerformanceReviewAnswer < ApplicationRecord
  belongs_to :performance_review_response # , inverse_of: :performance_review_answers
  belongs_to :performance_review_question

  # validates :answer, presence: true
  validates :performance_review_question_id, uniqueness: { scope: :performance_review_response_id }
end
