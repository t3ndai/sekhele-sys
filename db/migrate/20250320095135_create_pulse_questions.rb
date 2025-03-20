class CreatePulseQuestions < ActiveRecord::Migration[8.0]
  def change
    create_table :pulse_questions do |t|
      t.string :title

      t.timestamps
    end
  end
end
