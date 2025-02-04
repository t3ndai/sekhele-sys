class AddNameToEmployeeFile < ActiveRecord::Migration[8.0]
  def change
    add_column :employee_files, :name, :string
  end
end
