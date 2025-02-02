class CreateLocations < ActiveRecord::Migration[8.0]
  def change
    create_table :locations, id: :uuid do |t|
      t.string :name
      t.references :organization, null: false, foreign_key: true
      t.string :addr_line1
      t.string :addr_line2
      t.string :addr_line3
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
