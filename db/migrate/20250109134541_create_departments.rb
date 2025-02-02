class CreateDepartments < ActiveRecord::Migration[8.0]
  def change
    create_table :departments, id: :uuid do |t|
      t.string :name, null: false
      t.belongs_to :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
