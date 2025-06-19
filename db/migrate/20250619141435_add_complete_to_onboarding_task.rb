class AddCompleteToOnboardingTask < ActiveRecord::Migration[8.0]
  def change
    add_column :onboard_tasks, :complete, :boolean
  end
end
