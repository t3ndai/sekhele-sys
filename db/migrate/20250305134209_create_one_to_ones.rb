class CreateOneToOnes < ActiveRecord::Migration[8.0]
  def change
    create_table :one_to_ones do |t|
      t.belongs_to :employee, null: false, foreign_key: true
      t.belongs_to :manager, null: false, foreign_key: { to_table: :employees }

      t.timestamps
    end
  end
end
