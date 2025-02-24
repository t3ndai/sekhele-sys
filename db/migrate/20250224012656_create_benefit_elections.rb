class CreateBenefitElections < ActiveRecord::Migration[8.0]
  def change
    create_table :benefit_elections do |t|
      t.belongs_to :employee, null: false, foreign_key: true
      t.belongs_to :benefit_plan, null: false, foreign_key: true
      t.date :selected_on

      t.timestamps
    end
  end
end
