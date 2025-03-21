# == Schema Information
#
# Table name: job_postings
#
#  id              :integer          not null, primary key
#  organization_id :integer          not null
#  num_positions   :integer
#  title           :string
#  date_open       :date
#  date_close      :date
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_job_postings_on_organization_id  (organization_id)
#

require "test_helper"

class JobPostingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
