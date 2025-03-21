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

require "test_helper"

class DocumentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
