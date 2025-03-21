# == Schema Information
#
# Table name: job_applicants
#
#  id             :integer          not null, primary key
#  job_posting_id :integer          not null
#  applied_on     :date
#  first_name     :string
#  last_name      :string
#  middle_name    :string
#  email          :string
#  phone          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_job_applicants_on_job_posting_id  (job_posting_id)
#

require "test_helper"

class JobApplicantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
