class AddNoteToOneToOnes < ActiveRecord::Migration[8.0]
  def change
    add_column :one_to_ones, :note, :text
  end
end
