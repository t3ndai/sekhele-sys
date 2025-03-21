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

class TimeWorked < ApplicationRecord
  belongs_to :employee

  validates :start_time, :end_time, :day, presence: true
  validate :validates_time_worked_in_the_past

  def validates_time_worked_in_the_past
    if day.future?
      errors.add(:day, "day has to be in the past")
    end
  end

  def hours
    (end_time - start_time) / 3600
  end
end
