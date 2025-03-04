class CreateMilestones < ActiveRecord::Migration[8.0]
  def change
    create_table :milestones do |t|
      t.belongs_to :goal, null: false, foreign_key: true
      t.string :name
      t.date :completed_on
      t.date :started_on

      t.timestamps
    end
  end
end
