class Channel < ApplicationRecord
  belongs_to :organization
  validates :name, presence: true, uniqueness: { scope: :organization_id }

  has_many :channel_memberships
  has_many :members, through: :channel_memberships
end
