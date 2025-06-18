class CreateOnboardChecklists < ActiveRecord::Migration[8.0]
  def change
    create_table :onboard_checklists do |t|
      t.belongs_to :new_joiner, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
