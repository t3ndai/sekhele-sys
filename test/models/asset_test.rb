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

require "test_helper"

class AssetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
