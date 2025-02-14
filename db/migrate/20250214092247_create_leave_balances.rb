class CreateLeaveBalances < ActiveRecord::Migration[8.0]
  def change
    create_table :leave_balances do |t|
      t.belongs_to :employee, null: false, foreign_key: true
      t.belongs_to :leave_policy, null: false, foreign_key: true
      t.integer :time_taken, default: 0

      t.timestamps
    end
  end
end
