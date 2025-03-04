class CreateGoals < ActiveRecord::Migration[8.0]
  def change
    create_table :goals do |t|
      t.belongs_to :employee, null: false, foreign_key: true
      t.belongs_to :manager, null: false, foreign_key: { to_table: :employees }
      t.string :name
      t.date :starts_on
      t.date :ends_on

      t.timestamps
    end
  end
end
