class PerformanceReviewResponse < ApplicationRecord
  belongs_to :reviewer, class_name: "Employee"
  belongs_to :reviewee, class_name: "Employee"
  belongs_to :performance_review

  enum :status, { incomplete: "incomplete", draft: "draft", submitted: "submitted" }, default: :incomplete
end
