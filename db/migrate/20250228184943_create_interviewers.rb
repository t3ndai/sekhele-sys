class CreateInterviewers < ActiveRecord::Migration[8.0]
  def change
    create_table :interviewers do |t|
      t.belongs_to :interview, null: false, foreign_key: true
      t.belongs_to :employee, null: false, foreign_key: true
      t.date :assigned_on

      t.timestamps
    end
  end
end
