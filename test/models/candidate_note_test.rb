# == Schema Information
#
# Table name: candidate_notes
#
#  id               :integer          not null, primary key
#  job_applicant_id :integer          not null
#  employee_id      :integer          not null
#  note             :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_candidate_notes_on_employee_id       (employee_id)
#  index_candidate_notes_on_job_applicant_id  (job_applicant_id)
#

require "test_helper"

class CandidateNoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
