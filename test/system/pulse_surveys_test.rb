require "application_system_test_case"

class PulseSurveysTest < ApplicationSystemTestCase
  setup do
    @pulse_survey = pulse_surveys(:one)
  end

  test "visiting the index" do
    visit pulse_surveys_url
    assert_selector "h1", text: "Pulse surveys"
  end

  test "should create pulse survey" do
    visit pulse_surveys_url
    click_on "New pulse survey"

    fill_in "Date close", with: @pulse_survey.date_close
    fill_in "Date open", with: @pulse_survey.date_open
    fill_in "Name", with: @pulse_survey.name
    fill_in "Organization", with: @pulse_survey.organization_id
    click_on "Create Pulse survey"

    assert_text "Pulse survey was successfully created"
    click_on "Back"
  end

  test "should update Pulse survey" do
    visit pulse_survey_url(@pulse_survey)
    click_on "Edit this pulse survey", match: :first

    fill_in "Date close", with: @pulse_survey.date_close
    fill_in "Date open", with: @pulse_survey.date_open
    fill_in "Name", with: @pulse_survey.name
    fill_in "Organization", with: @pulse_survey.organization_id
    click_on "Update Pulse survey"

    assert_text "Pulse survey was successfully updated"
    click_on "Back"
  end

  test "should destroy Pulse survey" do
    visit pulse_survey_url(@pulse_survey)
    click_on "Destroy this pulse survey", match: :first

    assert_text "Pulse survey was successfully destroyed"
  end
end
