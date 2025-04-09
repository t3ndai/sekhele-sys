class CreateEmployeeLocations < ActiveRecord::Migration[8.0]
  def change
    create_table :employee_locations do |t|
      t.belongs_to :employee, null: false, foreign_key: true
      t.belongs_to :location, null: false, foreign_key: true
      t.date :date_from
      t.date :date_to

      t.timestamps
    end
  end
end
