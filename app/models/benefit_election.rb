class BenefitElection < ApplicationRecord
  belongs_to :employee
  belongs_to :benefit_plan
  has_many_attached :documents

  validates_uniqueness_of :employee_id, scope: [ :employee_id, :benefit_plan_id ]
end
