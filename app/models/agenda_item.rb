# == Schema Information
#
# Table name: agenda_items
#
#  id          :integer          not null, primary key
#  name        :string
#  employee_id :integer          not null
#  completed   :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_agenda_items_on_employee_id  (employee_id)
#

class AgendaItem < ApplicationRecord
  belongs_to :employee
end
