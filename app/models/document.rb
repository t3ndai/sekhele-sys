# == Schema Information
#
# Table name: documents
#
#  id              :integer          not null, primary key
#  name            :string
#  document_type   :string
#  required        :boolean
#  organization_id :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_documents_on_organization_id  (organization_id)
#

class Document < ApplicationRecord
  belongs_to :organization
  has_one :employee_file

  enum :document_type, { personal: "personal", company: "company" }, validate: { allow_nil: false }


  validates :name, presence: true, uniqueness: { scope: :organization_id }

  scope :company_docs, -> { where(document_type: :company) }

  scope :personal_docs, -> { where(document_type: :personal) }
end
