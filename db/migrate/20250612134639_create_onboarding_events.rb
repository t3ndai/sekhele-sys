class CreateOnboardingEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :onboarding_events do |t|
      t.belongs_to :new_joiner, null: false, foreign_key: true
      t.belongs_to :contact, null: false, foreign_key: { to_table: :employees }
      t.belongs_to :manager, null: false, foreign_key: { to_table: :employees }
      t.date :on
      t.time :at
      t.text :instructions

      t.timestamps
    end
  end
end
