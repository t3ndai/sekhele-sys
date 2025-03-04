class Milestone < ApplicationRecord
  belongs_to :goal
  has_rich_text :description
  has_many_attached :evidence

  validates :name, presence: true
  validates_uniqueness_of :name, scope: :goal_id
  validates :description, presence: true
  validates :started_on, presence: true
  validates :completed_on, timeliness: { after: :started_on, allow_blank: true }
end
