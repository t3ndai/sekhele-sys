class PraisePost < ApplicationRecord
  belongs_to :nominee, class_name: "Employee"
  belongs_to :nominator, class_name: "Employee"
  belongs_to :praise_type
  belongs_to :channel

  validates :message, presence: true

  # after create: notify nominee
end
