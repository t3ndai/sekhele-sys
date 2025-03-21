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

require "test_helper"

class DepartmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
