# == Schema Information
#
# Table name: asset_categories
#
#  id              :integer          not null, primary key
#  name            :string
#  organization_id :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_asset_categories_on_organization_id  (organization_id)
#

require "test_helper"

class AssetCategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
