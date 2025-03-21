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

require "test_helper"

class PerformanceReviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
