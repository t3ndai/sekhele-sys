# == Schema Information
#
# Table name: interviews
#
#  id                 :integer          not null, primary key
#  interview_stage_id :integer          not null
#  interview_on       :date
#  interview_at       :time
#  meeting_link       :string
#  room               :string
#  location           :string
#  job_applicant_id   :integer          not null
#  note               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_interviews_on_interview_stage_id  (interview_stage_id)
#  index_interviews_on_job_applicant_id    (job_applicant_id)
#

require "test_helper"

class InterviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
