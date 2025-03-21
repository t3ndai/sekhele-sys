# == Schema Information
#
# Table name: benefits
#
#  id              :integer          not null, primary key
#  organization_id :integer          not null
#  benefit_type_id :integer          not null
#  name            :string
#  valuation_type  :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_benefits_on_benefit_type_id  (benefit_type_id)
#  index_benefits_on_organization_id  (organization_id)
#

require "test_helper"

class BenefitTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
