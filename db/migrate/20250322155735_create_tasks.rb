class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.belongs_to :assigned_by, null: false, foreign_key: { to_table: :employees }
      t.belongs_to :assignee, null: false, foreign_key: { to_table: :employees }
      t.string :title
      t.date :due_on
      t.string :status
      t.text :notes

      t.timestamps
    end
  end
end
