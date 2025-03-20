class CreatePulseSurveyResponses < ActiveRecord::Migration[8.0]
  def change
    create_table :pulse_survey_responses do |t|
      t.belongs_to :pulse_survey, null: false, foreign_key: true
      t.belongs_to :responder, null: true, foreign_key: { to_table: :employees }
      t.uuid :annon_id
      t.date :submitted_on

      t.timestamps
    end
  end
end
