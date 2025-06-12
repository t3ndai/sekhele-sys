require "application_system_test_case"

class OnboardingEventsTest < ApplicationSystemTestCase
  setup do
    @onboarding_event = onboarding_events(:one)
  end

  test "visiting the index" do
    visit onboarding_events_url
    assert_selector "h1", text: "Onboarding events"
  end

  test "should create onboarding event" do
    visit onboarding_events_url
    click_on "New onboarding event"

    fill_in "At", with: @onboarding_event.at
    fill_in "Contact", with: @onboarding_event.contact_id
    fill_in "Instructions", with: @onboarding_event.instructions
    fill_in "Manager", with: @onboarding_event.manager_id
    fill_in "New joiner", with: @onboarding_event.new_joiner_id
    fill_in "On", with: @onboarding_event.on
    click_on "Create Onboarding event"

    assert_text "Onboarding event was successfully created"
    click_on "Back"
  end

  test "should update Onboarding event" do
    visit onboarding_event_url(@onboarding_event)
    click_on "Edit this onboarding event", match: :first

    fill_in "At", with: @onboarding_event.at.to_s
    fill_in "Contact", with: @onboarding_event.contact_id
    fill_in "Instructions", with: @onboarding_event.instructions
    fill_in "Manager", with: @onboarding_event.manager_id
    fill_in "New joiner", with: @onboarding_event.new_joiner_id
    fill_in "On", with: @onboarding_event.on
    click_on "Update Onboarding event"

    assert_text "Onboarding event was successfully updated"
    click_on "Back"
  end

  test "should destroy Onboarding event" do
    visit onboarding_event_url(@onboarding_event)
    click_on "Destroy this onboarding event", match: :first

    assert_text "Onboarding event was successfully destroyed"
  end
end
