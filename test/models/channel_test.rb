# == Schema Information
#
# Table name: channels
#
#  id              :integer          not null, primary key
#  organization_id :integer          not null
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_channels_on_organization_id  (organization_id)
#

require "test_helper"

class ChannelTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
