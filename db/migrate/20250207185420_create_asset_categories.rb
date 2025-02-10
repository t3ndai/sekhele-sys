class CreateAssetCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :asset_categories do |t|
      t.string :name
      t.belongs_to :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
