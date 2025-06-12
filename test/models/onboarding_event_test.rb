# == Schema Information
#
# Table name: onboarding_events
#
#  id            :integer          not null, primary key
#  new_joiner_id :integer          not null
#  contact_id    :integer          not null
#  manager_id    :integer          not null
#  on            :date
#  at            :time
#  instructions  :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  location      :string
#
# Indexes
#
#  index_onboarding_events_on_contact_id     (contact_id)
#  index_onboarding_events_on_manager_id     (manager_id)
#  index_onboarding_events_on_new_joiner_id  (new_joiner_id)
#

require "test_helper"

class OnboardingEventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
