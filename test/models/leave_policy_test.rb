# == Schema Information
#
# Table name: leave_policies
#
#  id                :integer          not null, primary key
#  leave_category_id :integer          not null
#  start_balance     :integer
#  valid_from        :date
#  valid_to          :date
#  organization_id   :integer          not null
#  name              :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_leave_policies_on_leave_category_id  (leave_category_id)
#  index_leave_policies_on_organization_id    (organization_id)
#

require "test_helper"

class LeavePolicyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
