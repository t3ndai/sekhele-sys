class PerformanceReviewQuestion < ApplicationRecord
  belongs_to :performance_review_type
  has_many :performance_review_answers
end
