# == Schema Information
#
# Table name: growth_areas
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  employee_id :integer
#
# Indexes
#
#  index_growth_areas_on_employee_id  (employee_id)
#

class GrowthArea < ApplicationRecord
  belongs_to :personal_development_plan

  validates :name, :description, presence: true
end
