class CreateInterviews < ActiveRecord::Migration[8.0]
  def change
    create_table :interviews do |t|
      t.belongs_to :interview_stage, null: false, foreign_key: true
      t.date :interview_on
      t.time :interview_at
      t.string :meeting_link
      t.string :room
      t.string :location
      t.belongs_to :job_applicant, null: false, foreign_key: true
      t.string :note

      t.timestamps
    end
  end
end
