class PerformanceReview < ApplicationRecord
  belongs_to :performance_review_type
  belongs_to :organization

  validates :name, presence: true, uniqueness: { scope: :organization_id }
  validates :opens_on, presence: true, timeliness: { on_or_after: -> { Date.current } }
  validates :closes_on, presence: true, timeliness: { on_or_after: :opens_on  }
  # TODO: Create background job to create peformance review response for each employee
  # after_create :create_performance_review_responses
end
