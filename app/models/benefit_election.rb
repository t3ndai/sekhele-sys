# == Schema Information
#
# Table name: benefit_elections
#
#  id              :integer          not null, primary key
#  employee_id     :integer          not null
#  benefit_plan_id :integer          not null
#  selected_on     :date
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_benefit_elections_on_benefit_plan_id  (benefit_plan_id)
#  index_benefit_elections_on_employee_id      (employee_id)
#

class BenefitElection < ApplicationRecord
  belongs_to :employee
  belongs_to :benefit_plan
  has_many_attached :documents

  validates_uniqueness_of :employee_id, scope: [ :employee_id, :benefit_plan_id ]
end
