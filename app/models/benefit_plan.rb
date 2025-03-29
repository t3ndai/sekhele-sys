# == Schema Information
#
# Table name: benefit_plans
#
#  id                    :integer          not null, primary key
#  benefit_id            :integer          not null
#  name                  :string
#  employer_contribution :decimal(, )
#  employee_contribution :decimal(, )
#  cover                 :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
# Indexes
#
#  index_benefit_plans_on_benefit_id  (benefit_id)
#
#

# TODO : Coverage starts on date
# TODO : Coverage ends on date

class BenefitPlan < ApplicationRecord
  belongs_to :benefit
  has_many_attached :documents

  enum :cover, { employee: 'employee', employee_plus_one: 'employee_plus_one', family: 'family' },
       validate: { allow_nil: false }

  validates :name, presence: true, uniqueness: { scope: :benefit_id }
  validates :employee_contribution, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :employer_contribution, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
