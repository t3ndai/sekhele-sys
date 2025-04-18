# == Schema Information
#
# Table name: performance_review_responses
#
#  id                    :integer          not null, primary key
#  reviewer_id           :integer          not null
#  reviewee_id           :integer          not null
#  status                :string
#  response              :jsonb
#  submitted_on          :date
#  performance_review_id :integer          not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
# Indexes
#
#  index_performance_review_responses_on_performance_review_id  (performance_review_id)
#  index_performance_review_responses_on_reviewee_id            (reviewee_id)
#  index_performance_review_responses_on_reviewer_id            (reviewer_id)
#

class PerformanceReviewResponse < ApplicationRecord
  belongs_to :reviewer, class_name: "Employee"
  belongs_to :reviewee, class_name: "Employee"
  belongs_to :performance_review
  has_many :performance_review_answers, dependent: :destroy, autosave: true, inverse_of: :performance_review_response
  accepts_nested_attributes_for :performance_review_answers, reject_if: :all_blank

  enum :status, { incomplete: "incomplete", draft: "draft", submitted: "submitted" }, default: :incomplete

  scope :reviews, -> (reviewee) {where(reviewee: reviewee).where(status: :submitted)}
end
