class CreateCostCenters < ActiveRecord::Migration[8.0]
  def change
    create_table :cost_centers, id: :uuid do |t|
      t.string :name
      t.string :description
      t.string :code
      t.belongs_to :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
