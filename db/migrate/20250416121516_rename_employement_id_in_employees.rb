class RenameEmployementIdInEmployees < ActiveRecord::Migration[8.0]
  def change
    change_table :employees do |t|
      t.rename :employement_id, :employment_id
    end
  end
end
