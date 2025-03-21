class CreatePulseSurveyAnswers < ActiveRecord::Migration[8.0]
  def change
    create_table :pulse_survey_answers do |t|
      t.belongs_to :pulse_question, null: false, foreign_key: true
      t.belongs_to :pulse_survey_response, null: false, foreign_key: true
      t.integer :sentiment
      t.text :answer

      t.timestamps
    end
  end
end
