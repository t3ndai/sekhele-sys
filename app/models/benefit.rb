class Benefit < ApplicationRecord
  belongs_to :organization
  belongs_to :benefit_type

  has_many :benefit_plans, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: [ :organization_id, :benefit_type_id ] }

  enum :valuation_type, { taxable: "taxable", non_taxable: "non_taxable" }
end
