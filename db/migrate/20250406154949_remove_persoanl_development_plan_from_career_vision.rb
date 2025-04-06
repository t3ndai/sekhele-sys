class RemovePersoanlDevelopmentPlanFromCareerVision < ActiveRecord::Migration[8.0]
  def change
    remove_reference :career_visions, :personal_development_plan, foreign_key: true
    add_reference :career_visions, :employee, foreign_key: true
  end
end
