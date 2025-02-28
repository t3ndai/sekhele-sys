class CreateJobApplicants < ActiveRecord::Migration[8.0]
  def change
    create_table :job_applicants do |t|
      t.belongs_to :job_posting, null: false, foreign_key: true
      t.date :applied_on
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
