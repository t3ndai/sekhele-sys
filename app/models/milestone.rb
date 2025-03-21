# == Schema Information
#
# Table name: milestones
#
#  id           :integer          not null, primary key
#  goal_id      :integer          not null
#  name         :string
#  completed_on :date
#  started_on   :date
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_milestones_on_goal_id  (goal_id)
#

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
