class CreatePulseSurveys < ActiveRecord::Migration[8.0]
  def change
    create_table :pulse_surveys do |t|
      t.date :date_open
      t.date :date_close
      t.string :name
      t.belongs_to :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
