# == Schema Information
#
# Table name: motivations
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
#  index_motivations_on_employee_id  (employee_id)
#

require "test_helper"

class MotivationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
