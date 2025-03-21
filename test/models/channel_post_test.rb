# == Schema Information
#
# Table name: channel_posts
#
#  id         :integer          not null, primary key
#  creator_id :integer          not null
#  likes      :integer
#  channel_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_channel_posts_on_channel_id  (channel_id)
#  index_channel_posts_on_creator_id  (creator_id)
#

require "test_helper"

class ChannelPostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
