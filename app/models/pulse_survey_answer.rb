class PulseSurveyAnswer < ApplicationRecord
  belongs_to :pulse_question
  belongs_to :pulse_survey_response

  enum :sentiment, { "strong disagree": 1, "disagree": 2, "neutral": 3, "agree": 4, "strong_agree": 5 }
end
