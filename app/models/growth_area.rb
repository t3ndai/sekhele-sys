# == Schema Information
#
# Table name: growth_areas
#
#  id                           :integer          not null, primary key
#  personal_development_plan_id :integer          not null
#  name                         :string
#  description                  :text
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#
# Indexes
#
#  index_growth_areas_on_personal_development_plan_id  (personal_development_plan_id)
#

class GrowthArea < ApplicationRecord
  belongs_to :personal_development_plan

  validates :name, :description, presence: true
end
