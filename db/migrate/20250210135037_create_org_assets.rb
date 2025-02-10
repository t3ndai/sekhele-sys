class CreateOrgAssets < ActiveRecord::Migration[8.0]
  def change
    create_table :org_assets do |t|
      t.belongs_to :employee, null: false, foreign_key: true
      t.belongs_to :asset_category, null: false, foreign_key: true
      t.date :date_given
      t.date :date_returned
      t.string :asset_name
      t.string :asset_serial_number

      t.timestamps
    end
  end
end
