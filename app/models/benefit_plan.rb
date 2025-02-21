class BenefitPlan < ApplicationRecord
  belongs_to :benefit
  has_many_attached :documents

  enum :cover, { employee: "employee", employee_plus_one: "employee_plus_one", family: "family" }, validate: { allow_nil: false }

  validates :name, presence: true, uniqueness: { scope: :benefit_id }
  validates :employee_contribution, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :employer_contribution, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
