# == Schema Information
#
# Table name: interview_stages
#
#  id              :integer          not null, primary key
#  organization_id :integer          not null
#  name            :string
#  mandatory       :string
#  stage_type      :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_interview_stages_on_organization_id  (organization_id)
#

require "test_helper"

class InterviewStageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
