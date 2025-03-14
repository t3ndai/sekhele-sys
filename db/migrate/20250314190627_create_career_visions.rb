class CreateCareerVisions < ActiveRecord::Migration[8.0]
  def change
    create_table :career_visions do |t|
      t.belongs_to :personal_development_plan, null: false, foreign_key: true
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
