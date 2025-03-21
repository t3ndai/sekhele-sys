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

require "test_helper"

class PerformanceReviewResponseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
