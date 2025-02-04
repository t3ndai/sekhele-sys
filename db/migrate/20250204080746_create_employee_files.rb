class CreateEmployeeFiles < ActiveRecord::Migration[8.0]
  def change
    create_table :employee_files do |t|
      t.references :document, null: false, foreign_key: true
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
