# == Schema Information
#
# Table name: personal_development_plans
#
#  id          :integer          not null, primary key
#  employee_id :integer          not null
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_personal_development_plans_on_employee_id  (employee_id)
#

class PersonalDevelopmentPlan < ApplicationRecord
  belongs_to :employee

  has_many :growth_areas, dependent: :destroy
  has_many :talents, dependent: :destroy
  has_many :career_visions, dependent: :destroy
  has_many :motivations, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :employee_id }
end
