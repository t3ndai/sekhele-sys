class Document < ApplicationRecord
  belongs_to :organization
  has_one :employee_file

  enum :document_type, { personal: "personal", company: "company" }, validate: { allow_nil: false }


  validates :name, presence: true, uniqueness: { scope: :organization_id }

  scope :company_docs, -> { where(document_type: :company) }

  scope :personal_docs, -> { where(document_type: :personal) }
end
