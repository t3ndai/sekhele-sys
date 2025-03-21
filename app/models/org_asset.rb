# == Schema Information
#
# Table name: org_assets
#
#  id                  :integer          not null, primary key
#  employee_id         :integer          not null
#  asset_category_id   :integer          not null
#  date_given          :date
#  date_returned       :date
#  asset_name          :string
#  asset_serial_number :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_org_assets_on_asset_category_id  (asset_category_id)
#  index_org_assets_on_employee_id        (employee_id)
#

class OrgAsset < ApplicationRecord
  belongs_to :employee
  belongs_to :asset_category

  validates :asset_name, presence: true, uniqueness: { scope: :employee_id }
end
