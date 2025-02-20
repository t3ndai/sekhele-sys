class CreateBenefits < ActiveRecord::Migration[8.0]
  def change
    create_table :benefits do |t|
      t.belongs_to :organization, null: false, foreign_key: true
      t.belongs_to :benefit_type, null: false, foreign_key: true
      t.string :name
      t.string :valuation_type

      t.timestamps
    end
  end
end
