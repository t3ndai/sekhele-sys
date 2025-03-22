# == Schema Information
#
# Table name: pulse_survey_answers
#
#  id                       :integer          not null, primary key
#  pulse_question_id        :integer          not null
#  pulse_survey_response_id :integer          not null
#  sentiment                :integer
#  answer                   :text
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#
# Indexes
#
#  index_pulse_survey_answers_on_pulse_question_id         (pulse_question_id)
#  index_pulse_survey_answers_on_pulse_survey_response_id  (pulse_survey_response_id)
#

class PulseSurveyAnswer < ApplicationRecord
  belongs_to :pulse_question, optional: true
  belongs_to :pulse_survey_response

  enum :sentiment, { "strong disagree": 1, "disagree": 2, "neutral": 3, "agree": 4, "strong_agree": 5 }, allow_nil: false

  validates :pulse_question, uniqueness: { scope: :pulse_survey_response }
end
