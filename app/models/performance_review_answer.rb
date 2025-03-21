# == Schema Information
#
# Table name: performance_review_answers
#
#  id                             :integer          not null, primary key
#  performance_review_response_id :integer          not null
#  performance_review_question_id :integer          not null
#  answer                         :text
#  created_at                     :datetime         not null
#  updated_at                     :datetime         not null
#
# Indexes
#
#  idx_on_performance_review_question_id_23a567a59b  (performance_review_question_id)
#  idx_on_performance_review_response_id_e91ff09fa5  (performance_review_response_id)
#

class PerformanceReviewAnswer < ApplicationRecord
  belongs_to :performance_review_response, inverse_of: :performance_review_answers
  belongs_to :performance_review_question

  validates :answer, presence: true
  validates :performance_review_question_id, uniqueness: { scope: :performance_review_response_id }
end
