class CreateCandidateNotes < ActiveRecord::Migration[8.0]
  def change
    create_table :candidate_notes do |t|
      t.belongs_to :job_applicant, null: false, foreign_key: true
      t.belongs_to :employee, null: false, foreign_key: true
      t.text :note

      t.timestamps
    end
  end
end
