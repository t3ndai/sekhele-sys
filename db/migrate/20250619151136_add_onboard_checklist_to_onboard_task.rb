class AddOnboardChecklistToOnboardTask < ActiveRecord::Migration[8.0]
  def change
    add_reference :onboard_tasks, :onboard_checklist, null: false, foreign_key: true
  end
end
