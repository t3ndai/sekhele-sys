# == Schema Information
#
# Table name: pulse_survey_responses
#
#  id              :integer          not null, primary key
#  pulse_survey_id :integer          not null
#  responder_id    :integer
#  annon_id        :uuid
#  submitted_on    :date
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_pulse_survey_responses_on_pulse_survey_id  (pulse_survey_id)
#  index_pulse_survey_responses_on_responder_id     (responder_id)
#

require "test_helper"

class PulseSurveyResponseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
