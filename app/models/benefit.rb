# == Schema Information
#
# Table name: benefits
#
#  id              :integer          not null, primary key
#  organization_id :integer          not null
#  benefit_type_id :integer          not null
#  name            :string
#  valuation_type  :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_benefits_on_benefit_type_id  (benefit_type_id)
#  index_benefits_on_organization_id  (organization_id)
#

class Benefit < ApplicationRecord
  belongs_to :organization
  belongs_to :benefit_type

  has_many :benefit_plans, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: [ :organization_id, :benefit_type_id ] }

  enum :valuation_type, { taxable: "taxable", non_taxable: "non_taxable" }

  scope :org_benefits, ->(org_id) { where(organization_id: org_id) }
end
