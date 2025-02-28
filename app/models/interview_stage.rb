class InterviewStage < ApplicationRecord
  belongs_to :organization

  enum :stage_type, { phone_screen: "phone_screen",
        hr_interview: "hr_interview", panel: "panel_interview", group_interview: "group_interview",
        technical_interview: "technical_interview", offer: "offer" }, validate: { allow_nil: false }
  enum :mandatory, { optional: "optional", required: "required" }, validate: { allow_nil: false }

  validates :name, presence: true
  validates :name, uniqueness: { scope: :organization_id }
end
