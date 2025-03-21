# == Schema Information
#
# Table name: locations
#
#  id              :integer          not null, primary key
#  name            :string
#  organization_id :integer          not null
#  addr_line1      :string
#  addr_line2      :string
#  addr_line3      :string
#  city            :string
#  country         :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_locations_on_organization_id  (organization_id)
#

require "test_helper"

class LocationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
