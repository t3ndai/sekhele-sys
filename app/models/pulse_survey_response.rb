class PulseSurveyResponse < ApplicationRecord
  belongs_to :pulse_survey
  belongs_to :responder, class_name: "Employee"
  has_many :pulse_survey_answer
  accepts_nested_attributes_for :pulse_survey_answer, reject_if: :all_blank
end
