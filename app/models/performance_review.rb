# == Schema Information
#
# Table name: performance_reviews
#
#  id                         :integer          not null, primary key
#  performance_review_type_id :integer          not null
#  opens_on                   :date
#  closes_on                  :date
#  name                       :string
#  organization_id            :integer          not null
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#
# Indexes
#
#  index_performance_reviews_on_organization_id             (organization_id)
#  index_performance_reviews_on_performance_review_type_id  (performance_review_type_id)
#

class PerformanceReview < ApplicationRecord
  belongs_to :performance_review_type
  belongs_to :organization

  has_many :performance_review_questions, through: :performance_review_type

  validates :name, presence: true, uniqueness: { scope: :organization_id }
  validates :opens_on, presence: true, timeliness: { on_or_after: -> { Date.current } }
  validates :closes_on, presence: true, timeliness: { on_or_after: :opens_on  }
  # TODO: Create background job to create peformance review response for each employee
  after_create :create_performance_review_responses

  private
  def create_performance_review_responses
    Employee.same_organization(self.organization).find_each do |employee|
      if self.performance_review_type.name == "downward" && employee.is_manager?
        employee.reports.each do |report|
          PerformanceReviewResponse.create!(reviewer: employee, reviewee: report, performance_review: self)
        end
      end
    end
  end
end
