# == Schema Information
#
# Table name: pulse_surveys
#
#  id              :integer          not null, primary key
#  date_open       :date
#  date_close      :date
#  name            :string
#  organization_id :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_pulse_surveys_on_organization_id  (organization_id)
#

require "test_helper"

class PulseSurveyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
