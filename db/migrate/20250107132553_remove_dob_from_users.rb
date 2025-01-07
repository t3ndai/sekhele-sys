class RemoveDobFromUsers < ActiveRecord::Migration[8.0]
  def change
    remove_column :users, :dob, :date
  end
end
