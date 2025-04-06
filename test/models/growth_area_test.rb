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

require "test_helper"

class GrowthAreaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
