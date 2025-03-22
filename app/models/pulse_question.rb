# == Schema Information
#
# Table name: pulse_questions
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PulseQuestion < ApplicationRecord
  has_many :pulse_survey_answers
end
