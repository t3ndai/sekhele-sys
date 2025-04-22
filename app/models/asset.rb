# == Schema Information
#
# Table name: assets
#
#  id                :integer          not null, primary key
#  organization_id   :integer          not null
#  asset_category_id :integer          not null
#  name              :string
#  serial_number     :string
#  status            :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_assets_on_asset_category_id  (asset_category_id)
#  index_assets_on_organization_id    (organization_id)
#

class Asset < ApplicationRecord
  belongs_to :organization
  belongs_to :asset_category

  before_save :set_serial_number

  enum :status, { active: "active", inactive: "inactive", lost: "lost", stolen: "stolen" }, default: :inactive

  def set_serial_number
    self.serial_number = SecureRandom.hex(4) if self.serial_number.blank?
    puts self.serial_number
  end
end
