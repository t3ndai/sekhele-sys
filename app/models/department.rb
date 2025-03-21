# == Schema Information
#
# Table name: departments
#
#  id              :integer          not null, primary key
#  name            :string           not null
#  organization_id :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_departments_on_organization_id  (organization_id)
#

class Department < ApplicationRecord
  belongs_to :organization
  has_many :job_functions

  validates :name, presence: true, uniqueness: { scope: :organization_id }
end
