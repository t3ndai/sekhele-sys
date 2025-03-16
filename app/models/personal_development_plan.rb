class PersonalDevelopmentPlan < ApplicationRecord
  belongs_to :employee

  has_many :growth_areas, dependent: :destroy
  has_many :talents, dependent: :destroy
  has_many :career_visions, dependent: :destroy
  has_many :motivations, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :employee_id }
end
