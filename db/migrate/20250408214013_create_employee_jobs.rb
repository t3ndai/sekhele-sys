class CreateEmployeeJobs < ActiveRecord::Migration[8.0]
  def change
    create_table :employee_jobs do |t|
      t.belongs_to :job_function, null: false, foreign_key: true
      t.belongs_to :employee, null: false, foreign_key: true
      t.belongs_to :job_level, null: false, foreign_key: true
      t.date :started_on
      t.date :ended_on

      t.timestamps
    end
  end
end
