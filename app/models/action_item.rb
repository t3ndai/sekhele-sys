class ActionItem < ApplicationRecord
  belongs_to :one_to_one

  validates :name, presence: true
end
