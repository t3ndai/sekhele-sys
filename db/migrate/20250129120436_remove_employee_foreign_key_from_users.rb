class RemoveEmployeeForeignKeyFromUsers < ActiveRecord::Migration[8.0]
  def change
    remove_foreign_key :users, :employees
  end
end
