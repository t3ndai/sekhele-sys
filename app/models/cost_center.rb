# == Schema Information
#
# Table name: cost_centers
#
#  id              :integer          not null, primary key
#  name            :string
#  description     :string
#  code            :string
#  organization_id :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_cost_centers_on_organization_id  (organization_id)
#

class CostCenter < ApplicationRecord
  belongs_to :organization
end
