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

class PulseSurveyResponse < ApplicationRecord
  belongs_to :pulse_survey
  belongs_to :responder, class_name: "Employee", optional: true
  has_many :pulse_survey_answers, dependent: :destroy, inverse_of: :pulse_survey_response, autosave: true, index_errors: true
  accepts_nested_attributes_for :pulse_survey_answers, reject_if: :all_blank, update_only: true
end
