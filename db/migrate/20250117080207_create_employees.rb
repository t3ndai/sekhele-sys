class CreateEmployees < ActiveRecord::Migration[8.0]
  def change
    create_table :employees, id: :uuid do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.date :dob, null: false
      t.string :addr_line1
      t.string :addr_line2
      t.string :addr_line3
      t.string :addr_postcode
      t.string :city, null: false
      t.string :country, null: false
      t.string :phone1, null: false
      t.string :phone2
      t.string :personal_email, null: false
      t.string :work_email, null: false
      t.string :id_number, null: false
      t.string :nationality, null: false
      t.string :passport_number
      t.date :hire_date, null: false
      t.string :employement_id
      t.string :preferred_name
      t.belongs_to :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
