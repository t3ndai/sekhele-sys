class AddManagerToEmployees < ActiveRecord::Migration[8.0]
  def change
    add_reference :employees, :manager, foreign_key: { to_table: :employees }
  end
end
