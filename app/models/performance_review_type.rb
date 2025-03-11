class PerformanceReviewType < ApplicationRecord
  has_many :performance_review_questions, dependent: :destroy
  has_many :performance_reviews, dependent: :destroy
end
