class CreateCandidateStatuses < ActiveRecord::Migration[8.0]
  def change
    create_table :candidate_statuses do |t|
      t.belongs_to :job_applicant, null: false, foreign_key: true, index: {unique: true}
      t.string :status
      t.text :reason
      t.belongs_to :status_by, null: false, foreign_key: {to_table: :employees}

      t.timestamps
    end
  end
end
