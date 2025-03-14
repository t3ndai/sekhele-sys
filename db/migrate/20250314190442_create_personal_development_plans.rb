class CreatePersonalDevelopmentPlans < ActiveRecord::Migration[8.0]
  def change
    create_table :personal_development_plans do |t|
      t.belongs_to :employee, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
