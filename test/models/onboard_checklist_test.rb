# == Schema Information
#
# Table name: onboard_checklists
#
#  id            :integer          not null, primary key
#  new_joiner_id :integer          not null
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_onboard_checklists_on_new_joiner_id  (new_joiner_id)
#

require "test_helper"

class OnboardChecklistTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
