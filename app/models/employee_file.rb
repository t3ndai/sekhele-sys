class EmployeeFile < ApplicationRecord
  belongs_to :document
  belongs_to :employee
  has_one_attached :file
end
