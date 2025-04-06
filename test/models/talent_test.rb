# == Schema Information
#
# Table name: talents
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
#  index_talents_on_employee_id  (employee_id)
#

require "test_helper"

class TalentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
