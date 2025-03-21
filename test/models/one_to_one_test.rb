# == Schema Information
#
# Table name: one_to_ones
#
#  id          :integer          not null, primary key
#  employee_id :integer          not null
#  manager_id  :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_one_to_ones_on_employee_id  (employee_id)
#  index_one_to_ones_on_manager_id   (manager_id)
#

require "test_helper"

class OneToOneTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
