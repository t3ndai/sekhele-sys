class CreateJobFunctions < ActiveRecord::Migration[8.0]
  def change
    create_table :job_functions do |t|
      t.string :title
      t.references :department, null: true, foreign_key: true
      t.references :organization, null: false, foreign_key: true
      t.numrange :salary_range

      t.timestamps
    end
  end
end
