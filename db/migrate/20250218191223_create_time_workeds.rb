class CreateTimeWorkeds < ActiveRecord::Migration[8.0]
  def change
    create_table :time_workeds do |t|
      t.time :start_time
      t.time :end_time
      t.text :note
      t.date :day
      t.belongs_to :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
