class ChannelPost < ApplicationRecord
  belongs_to :creator, class_name: "Employee"
  belongs_to :channel

  has_rich_text :content
  validates :content, presence: true
end
