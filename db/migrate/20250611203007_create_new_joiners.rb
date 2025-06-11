class CreateNewJoiners < ActiveRecord::Migration[8.0]
  def change
    create_table :new_joiners do |t|
      t.date :start_date
      t.belongs_to :manager, null: true, foreign_key: { to_table: :employees }
      t.belongs_to :job_applicant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
