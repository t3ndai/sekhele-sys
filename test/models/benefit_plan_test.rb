# == Schema Information
#
# Table name: benefit_plans
#
#  id                    :integer          not null, primary key
#  benefit_id            :integer          not null
#  name                  :string
#  employer_contribution :decimal(, )
#  employee_contribution :decimal(, )
#  cover                 :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
# Indexes
#
#  index_benefit_plans_on_benefit_id  (benefit_id)
#

require "test_helper"

class BenefitPlanTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
