class OnboardTask < ApplicationRecord
  belongs_to :assignee, class_name: "Employee"
  belongs_to :onboard_checklist

  validates :name, presence: true
end
