require "application_system_test_case"

class PulseSurveyResponsesTest < ApplicationSystemTestCase
  setup do
    @pulse_survey_response = pulse_survey_responses(:one)
  end

  test "visiting the index" do
    visit pulse_survey_responses_url
    assert_selector "h1", text: "Pulse survey responses"
  end

  test "should create pulse survey response" do
    visit pulse_survey_responses_url
    click_on "New pulse survey response"

    fill_in "Annon", with: @pulse_survey_response.annon_id
    fill_in "Pulse survey", with: @pulse_survey_response.pulse_survey_id
    fill_in "Responder", with: @pulse_survey_response.responder_id
    fill_in "Submitted on", with: @pulse_survey_response.submitted_on
    click_on "Create Pulse survey response"

    assert_text "Pulse survey response was successfully created"
    click_on "Back"
  end

  test "should update Pulse survey response" do
    visit pulse_survey_response_url(@pulse_survey_response)
    click_on "Edit this pulse survey response", match: :first

    fill_in "Annon", with: @pulse_survey_response.annon_id
    fill_in "Pulse survey", with: @pulse_survey_response.pulse_survey_id
    fill_in "Responder", with: @pulse_survey_response.responder_id
    fill_in "Submitted on", with: @pulse_survey_response.submitted_on
    click_on "Update Pulse survey response"

    assert_text "Pulse survey response was successfully updated"
    click_on "Back"
  end

  test "should destroy Pulse survey response" do
    visit pulse_survey_response_url(@pulse_survey_response)
    click_on "Destroy this pulse survey response", match: :first

    assert_text "Pulse survey response was successfully destroyed"
  end
end
