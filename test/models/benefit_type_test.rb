# == Schema Information
#
# Table name: benefit_types
#
#  id              :integer          not null, primary key
#  name            :string
#  organization_id :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_benefit_types_on_organization_id  (organization_id)
#

require "test_helper"

class BenefitTypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
