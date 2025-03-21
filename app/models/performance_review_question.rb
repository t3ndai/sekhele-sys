# == Schema Information
#
# Table name: performance_review_questions
#
#  id                         :integer          not null, primary key
#  performance_review_type_id :integer          not null
#  title                      :string
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#
# Indexes
#
#  idx_on_performance_review_type_id_bfd408f188  (performance_review_type_id)
#

class PerformanceReviewQuestion < ApplicationRecord
  belongs_to :performance_review_type
  has_many :performance_review_answers
end
