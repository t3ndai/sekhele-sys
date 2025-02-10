class OrgAsset < ApplicationRecord
  belongs_to :employee
  belongs_to :asset_category

  validates :asset_name, presence: true, uniqueness: { scope: :employee_id }
end
