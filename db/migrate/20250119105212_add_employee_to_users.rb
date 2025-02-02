class AddEmployeeToUsers < ActiveRecord::Migration[8.0]
  def change
    add_reference :users, :employee, null: true
  end
end
