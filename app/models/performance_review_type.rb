# == Schema Information
#
# Table name: performance_review_types
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PerformanceReviewType < ApplicationRecord
  has_many :performance_review_questions, dependent: :destroy
  has_many :performance_reviews, dependent: :destroy
end
