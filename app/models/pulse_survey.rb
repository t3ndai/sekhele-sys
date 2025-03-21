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

class PulseSurvey < ApplicationRecord
  belongs_to :organization

  validates :name, presence: true, uniqueness: { scope: :organization_id }
  validates :date_open, presence: true, timeliness: { on_or_after: Date.current }
  validates :date_close, presence: true, timeliness: { on_or_after: :date_open }

  after_create :create_pulse_survey_responses

  private

  def create_pulse_survey_responses
    self.organization.employees.find_each do |employee|
      PulseSurveyResponse.create!(responder: employee, pulse_survey: self)
    end
  end
end
