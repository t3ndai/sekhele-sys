class CreateActionItems < ActiveRecord::Migration[8.0]
  def change
    create_table :action_items do |t|
      t.string :name
      t.boolean :completed
      t.belongs_to :one_to_one, null: false, foreign_key: true

      t.timestamps
    end
  end
end
