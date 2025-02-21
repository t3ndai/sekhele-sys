class CreateBenefitPlans < ActiveRecord::Migration[8.0]
  def change
    create_table :benefit_plans do |t|
      t.belongs_to :benefit, null: false, foreign_key: true
      t.string :name
      t.decimal :employer_contribution
      t.decimal :employee_contribution
      t.string :cover

      t.timestamps
    end
  end
end
