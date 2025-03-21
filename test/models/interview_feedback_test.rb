# == Schema Information
#
# Table name: interview_feedbacks
#
#  id             :integer          not null, primary key
#  interview_id   :integer          not null
#  interviewer_id :integer          not null
#  status         :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_interview_feedbacks_on_interview_id    (interview_id)
#  index_interview_feedbacks_on_interviewer_id  (interviewer_id)
#

require "test_helper"

class InterviewFeedbackTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
