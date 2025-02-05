class CompanyFile < ApplicationRecord
  belongs_to :document
  belongs_to :organization
  has_one_attached :file

  validates :name, uniqueness: { scope: :organization_id }
end
