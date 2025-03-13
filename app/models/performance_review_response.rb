class PerformanceReviewResponse < ApplicationRecord
  belongs_to :reviewer, class_name: "Employee"
  belongs_to :reviewee, class_name: "Employee"
  belongs_to :performance_review
  has_many :performance_review_answers, dependent: :destroy, autosave: true, inverse_of: :performance_review_response
  accepts_nested_attributes_for :performance_review_answers, reject_if: :all_blank

  enum :status, { incomplete: "incomplete", draft: "draft", submitted: "submitted" }, default: :incomplete
end
