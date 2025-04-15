# == Schema Information
#
# Table name: candidate_statuses
#
#  id               :integer          not null, primary key
#  job_applicant_id :integer          not null
#  status           :string
#  reason           :text
#  status_by_id     :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_candidate_statuses_on_job_applicant_id  (job_applicant_id) UNIQUE
#  index_candidate_statuses_on_status_by_id      (status_by_id)
#

require "test_helper"

class CandidateStatusTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
