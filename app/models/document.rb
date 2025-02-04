class Document < ApplicationRecord
  belongs_to :organization
  has_one :employee_file

  enum :document_type, { personal: "personal", company: "company" }, validate: { allow_nil: false }


  validates :name, presence: true, uniqueness: { scope: :organization_id }
end
