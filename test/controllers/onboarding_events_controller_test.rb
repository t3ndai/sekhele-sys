require "test_helper"

class OnboardingEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @onboarding_event = onboarding_events(:one)
  end

  test "should get index" do
    get onboarding_events_url
    assert_response :success
  end

  test "should get new" do
    get new_onboarding_event_url
    assert_response :success
  end

  test "should create onboarding_event" do
    assert_difference("OnboardingEvent.count") do
      post onboarding_events_url, params: { onboarding_event: { at: @onboarding_event.at, contact_id: @onboarding_event.contact_id, instructions: @onboarding_event.instructions, manager_id: @onboarding_event.manager_id, new_joiner_id: @onboarding_event.new_joiner_id, on: @onboarding_event.on } }
    end

    assert_redirected_to onboarding_event_url(OnboardingEvent.last)
  end

  test "should show onboarding_event" do
    get onboarding_event_url(@onboarding_event)
    assert_response :success
  end

  test "should get edit" do
    get edit_onboarding_event_url(@onboarding_event)
    assert_response :success
  end

  test "should update onboarding_event" do
    patch onboarding_event_url(@onboarding_event), params: { onboarding_event: { at: @onboarding_event.at, contact_id: @onboarding_event.contact_id, instructions: @onboarding_event.instructions, manager_id: @onboarding_event.manager_id, new_joiner_id: @onboarding_event.new_joiner_id, on: @onboarding_event.on } }
    assert_redirected_to onboarding_event_url(@onboarding_event)
  end

  test "should destroy onboarding_event" do
    assert_difference("OnboardingEvent.count", -1) do
      delete onboarding_event_url(@onboarding_event)
    end

    assert_redirected_to onboarding_events_url
  end
end
