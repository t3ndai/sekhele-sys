# == Schema Information
#
# Table name: praise_posts
#
#  id             :integer          not null, primary key
#  nominee_id     :integer          not null
#  nominator_id   :integer          not null
#  praise_type_id :integer          not null
#  message        :text
#  channel_id     :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_praise_posts_on_channel_id      (channel_id)
#  index_praise_posts_on_nominator_id    (nominator_id)
#  index_praise_posts_on_nominee_id      (nominee_id)
#  index_praise_posts_on_praise_type_id  (praise_type_id)
#

class PraisePost < ApplicationRecord
  belongs_to :nominee, class_name: "Employee"
  belongs_to :nominator, class_name: "Employee"
  belongs_to :praise_type
  belongs_to :channel

  validates :message, presence: true

  # after create: notify nominee
end
