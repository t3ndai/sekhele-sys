# == Schema Information
#
# Table name: interview_stages
#
#  id              :integer          not null, primary key
#  organization_id :integer          not null
#  name            :string
#  mandatory       :string
#  stage_type      :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_interview_stages_on_organization_id  (organization_id)
#

class InterviewStage < ApplicationRecord
  belongs_to :organization

  enum :stage_type, { phone_screen: "phone_screen",
        hr_interview: "hr_interview", panel: "panel_interview", group_interview: "group_interview",
        technical_interview: "technical_interview", offer: "offer" }, validate: { allow_nil: false }
  enum :mandatory, { optional: "optional", required: "required" }, validate: { allow_nil: false }

  validates :name, presence: true
  validates :name, uniqueness: { scope: :organization_id }
end
