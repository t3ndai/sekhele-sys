class CreateInterviewFeedbacks < ActiveRecord::Migration[8.0]
  def change
    create_table :interview_feedbacks do |t|
      t.belongs_to :interview, null: false, foreign_key: true
      t.belongs_to :interviewer, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
