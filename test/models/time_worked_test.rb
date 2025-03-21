# == Schema Information
#
# Table name: time_workeds
#
#  id          :integer          not null, primary key
#  start_time  :time
#  end_time    :time
#  note        :text
#  day         :date
#  employee_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_time_workeds_on_employee_id  (employee_id)
#

require "test_helper"

class TimeWorkedTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
