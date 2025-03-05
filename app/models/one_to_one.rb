class OneToOne < ApplicationRecord
  belongs_to :employee
  belongs_to :manager, class_name: "Employee"
  has_rich_text :note
end
