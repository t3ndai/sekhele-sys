class CreateAssets < ActiveRecord::Migration[8.0]
  def change
    create_table :assets do |t|
      t.belongs_to :organization, null: false, foreign_key: true
      t.belongs_to :asset_category, null: false, foreign_key: true
      t.string :name
      t.string :serial_number
      t.string :status

      t.timestamps
    end
  end
end
