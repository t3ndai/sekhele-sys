class CreateEmergencyContacts < ActiveRecord::Migration[8.0]
  def change
    create_table :emergency_contacts do |t|
      t.belongs_to :employee, null: false, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :phone1
      t.string :phone2
      t.string :addr_line1
      t.string :addr_line2
      t.string :addr_lin3
      t.string :city
      t.string :postcode
      t.string :country

      t.timestamps
    end
  end
end
