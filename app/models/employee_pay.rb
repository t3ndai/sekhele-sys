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

class EmployeePay < ApplicationRecord
  belongs_to :employee

  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :currency, :pay_type, :frequency, :start_date, presence: true

  enum :currency, { usd: "USD", zwg: "ZWD", zar: "ZAR", zmw: "ZMW", bwp: "BWP"  }
  enum :pay_type, { wage: "Wage", salary: "Salary"  }
  enum :frequency, { hourly: "Hourly", daily: "Daily", weekly: "Weekly", monthly: "Monthly", yearly: "Yearly" }
end
