class RemovePersoanlDevelopmentPlanFromGrowthArea < ActiveRecord::Migration[8.0]
  def change
    remove_reference :growth_areas, :personal_development_plan, foreign_key: true
    add_reference :growth_areas, :employee, foreign_key: true
  end
end
