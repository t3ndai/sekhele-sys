class JobPosting < ApplicationRecord
  belongs_to :organization
  has_rich_text :description

  validates :title, :description, :date_open, :date_close, presence: true
  validates :num_positions, numericality: { only_integer: true, greater_than: 0 }
  validates :date_open, :date_close, timeliness: { on_or_after: Date.current }
  validates :date_close, timeliness: { on_or_after: :date_open }
end
