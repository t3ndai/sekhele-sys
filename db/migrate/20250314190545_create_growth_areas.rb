class CreateGrowthAreas < ActiveRecord::Migration[8.0]
  def change
    create_table :growth_areas do |t|
      t.belongs_to :personal_development_plan, null: false, foreign_key: true
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
