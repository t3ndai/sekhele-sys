# == Schema Information
#
# Table name: company_files
#
#  id              :integer          not null, primary key
#  name            :string
#  document_id     :integer          not null
#  organization_id :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_company_files_on_document_id      (document_id)
#  index_company_files_on_organization_id  (organization_id)
#

class CompanyFile < ApplicationRecord
  belongs_to :document
  belongs_to :organization
  has_one_attached :file

  validates :name, uniqueness: { scope: :organization_id }
end
