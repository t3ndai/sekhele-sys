# == Schema Information
#
# Table name: leave_categories
#
#  id              :integer          not null, primary key
#  name            :string
#  organization_id :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_leave_categories_on_organization_id  (organization_id)
#

class LeaveCategory < ApplicationRecord
  belongs_to :organization

  validates :name, presence: true, uniqueness: { scope: :organization_id }
end
