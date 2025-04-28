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

class Channel < ApplicationRecord
  belongs_to :organization
  validates :name, presence: true, uniqueness: { scope: :organization_id }

  has_many :channel_posts
  has_many :channel_memberships
  has_many :members, through: :channel_memberships

  scope :all_company, -> { where(name: 'All Company')}
end
