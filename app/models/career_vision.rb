# == Schema Information
#
# Table name: career_visions
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  employee_id :integer
#  outline     :string
#
# Indexes
#
#  index_career_visions_on_employee_id  (employee_id)
#

class CareerVision < ApplicationRecord
  belongs_to :employee

  enum :outline, { "6_months": "6_months", "1_year": "1_year", "3_years": "3_years", "5_years": "5_years", "10_years": "10_years" }, allow_nil: false

  validates :name, :description, presence: true, uniqueness: { scope: [ :employee_id, :outline ], message: "already exists" }
end
