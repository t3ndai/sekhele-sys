class CreateDepartments < ActiveRecord::Migration[8.0]
  def change
    create_table :departments do |t|
      t.string :name, null: false
      t.belongs_to :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
