class RemovePersonalDevelopmentPlanFromMotivation < ActiveRecord::Migration[8.0]
  def change
    remove_reference :motivations, :personal_development_plan, foreign_key: true
    add_reference :motivations, :employee, foreign_key: true
  end
end
