class CreateInterviewStages < ActiveRecord::Migration[8.0]
  def change
    create_table :interview_stages do |t|
      t.belongs_to :organization, null: false, foreign_key: true
      t.string :name
      t.string :mandatory
      t.string :stage_type

      t.timestamps
    end
  end
end
