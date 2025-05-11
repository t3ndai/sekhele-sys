# == Schema Information
#
# Table name: employee_files
#
#  id          :integer          not null, primary key
#  document_id :integer          not null
#  employee_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  name        :string
#
# Indexes
#
#  index_employee_files_on_document_id  (document_id)
#  index_employee_files_on_employee_id  (employee_id)
#

class EmployeeFile < ApplicationRecord
  belongs_to :document
  belongs_to :employee
  has_one_attached :file

  validates :name, uniqueness: { scope: [ :document_id, :employee_id ] }
end
