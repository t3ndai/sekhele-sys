class CreateJobLevels < ActiveRecord::Migration[8.0]
  def change
    create_table :job_levels do |t|
      t.references :job_function, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
