class RemovePersoanlDevelopmentPlanFromTalent < ActiveRecord::Migration[8.0]
  def change
    remove_reference :talents, :personal_development_plan, foreign_key: true
    add_reference :talents, :employee, foreign_key: true
  end
end
