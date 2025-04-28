class CreateEmployeePays < ActiveRecord::Migration[8.0]
  def change
    create_table :employee_pays do |t|
      t.belongs_to :employee, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.decimal :amount
      t.string :pay_type
      t.string :currency
      t.string :frequency

      t.timestamps
    end
  end
end
