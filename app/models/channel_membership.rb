# == Schema Information
#
# Table name: channel_memberships
#
#  id         :integer          not null, primary key
#  channel_id :integer          not null
#  member_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_channel_memberships_on_channel_id  (channel_id)
#  index_channel_memberships_on_member_id   (member_id)
#

class ChannelMembership < ApplicationRecord
  belongs_to :channel
  belongs_to :member, class_name: "Employee"

  validates :member, uniqueness: { scope: :channel }
end
