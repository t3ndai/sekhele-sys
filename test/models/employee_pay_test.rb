# == Schema Information
#
# Table name: employee_pays
#
#  id          :integer          not null, primary key
#  employee_id :integer          not null
#  start_date  :date
#  end_date    :date
#  amount      :decimal(, )
#  pay_type    :string
#  currency    :string
#  frequency   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_employee_pays_on_employee_id  (employee_id)
#

require "test_helper"

class EmployeePayTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
