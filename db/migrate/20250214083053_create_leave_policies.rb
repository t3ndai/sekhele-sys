class CreateLeavePolicies < ActiveRecord::Migration[8.0]
  def change
    create_table :leave_policies do |t|
      t.belongs_to :leave_category, null: false, foreign_key: true
      t.integer :start_balance
      t.date :valid_from
      t.date :valid_to
      t.belongs_to :organization, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
