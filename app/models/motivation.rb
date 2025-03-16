class Motivation < ApplicationRecord
  belongs_to :personal_development_plan

  validates :name, :description, presence: true
end
