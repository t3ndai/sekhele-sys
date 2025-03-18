class ChannelMembership < ApplicationRecord
  belongs_to :channel
  belongs_to :member, class_name: "Employee"

  validates :member, uniqueness: { scope: :channel }
end
