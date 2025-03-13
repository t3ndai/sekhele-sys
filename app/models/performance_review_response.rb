class PerformanceReviewResponse < ApplicationRecord
  belongs_to :reviewer, class_name: "Employee"
  belongs_to :reviewee, class_name: "Employee"
  belongs_to :performance_review
  has_many :performance_review_answers, dependent: :destroy
  accepts_nested_attributes_for :performance_review_answers # , reject_if: lambda { |attributes| attributes[:answer].blank? }

  enum :status, { incomplete: "incomplete", draft: "draft", submitted: "submitted" }, default: :incomplete
end
