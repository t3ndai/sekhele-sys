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

require "test_helper"

class CompanyFileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
