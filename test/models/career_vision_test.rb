# == Schema Information
#
# Table name: career_visions
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
#  index_career_visions_on_employee_id  (employee_id)
#

require "test_helper"

class CareerVisionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
