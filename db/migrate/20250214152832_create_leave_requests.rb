class CreateLeaveRequests < ActiveRecord::Migration[8.0]
  def change
    create_table :leave_requests do |t|
      t.belongs_to :employee, null: false, foreign_key: true
      t.belongs_to :leave_policy, null: false, foreign_key: true
      t.string :status
      t.date :date_from
      t.date :date_to
      t.text :reason

      t.timestamps
    end
  end
end
