class CreateJobPostings < ActiveRecord::Migration[8.0]
  def change
    create_table :job_postings do |t|
      t.belongs_to :organization, null: false, foreign_key: true
      t.integer :num_positions
      t.string :title
      t.date :date_open
      t.date :date_close

      t.timestamps
    end
  end
end
