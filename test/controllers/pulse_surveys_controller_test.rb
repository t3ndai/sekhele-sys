require "test_helper"

class PulseSurveysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pulse_survey = pulse_surveys(:one)
  end

  test "should get index" do
    get pulse_surveys_url
    assert_response :success
  end

  test "should get new" do
    get new_pulse_survey_url
    assert_response :success
  end

  test "should create pulse_survey" do
    assert_difference("PulseSurvey.count") do
      post pulse_surveys_url, params: { pulse_survey: { date_close: @pulse_survey.date_close, date_open: @pulse_survey.date_open, name: @pulse_survey.name, organization_id: @pulse_survey.organization_id } }
    end

    assert_redirected_to pulse_survey_url(PulseSurvey.last)
  end

  test "should show pulse_survey" do
    get pulse_survey_url(@pulse_survey)
    assert_response :success
  end

  test "should get edit" do
    get edit_pulse_survey_url(@pulse_survey)
    assert_response :success
  end

  test "should update pulse_survey" do
    patch pulse_survey_url(@pulse_survey), params: { pulse_survey: { date_close: @pulse_survey.date_close, date_open: @pulse_survey.date_open, name: @pulse_survey.name, organization_id: @pulse_survey.organization_id } }
    assert_redirected_to pulse_survey_url(@pulse_survey)
  end

  test "should destroy pulse_survey" do
    assert_difference("PulseSurvey.count", -1) do
      delete pulse_survey_url(@pulse_survey)
    end

    assert_redirected_to pulse_surveys_url
  end
end
