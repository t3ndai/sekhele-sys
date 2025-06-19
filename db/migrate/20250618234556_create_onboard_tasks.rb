class CreateOnboardTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :onboard_tasks do |t|
      t.string :name
      t.belongs_to :assignee, null: false, foreign_key: { to_table: :employees }
      t.string :tags, array: true, default: []
      t.date :due_on

      t.timestamps
    end
    add_index :onboard_tasks, :tags, using: "gin"
  end
end
