class CreateBenefitTypes < ActiveRecord::Migration[8.0]
  def change
    create_table :benefit_types do |t|
      t.string :name
      t.belongs_to :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
