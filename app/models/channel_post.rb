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

class ChannelPost < ApplicationRecord
  belongs_to :creator, class_name: "Employee"
  belongs_to :channel

  has_rich_text :content
  validates :content, presence: true
end
