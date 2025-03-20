require "test_helper"

class PulseSurveyResponsesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pulse_survey_response = pulse_survey_responses(:one)
  end

  test "should get index" do
    get pulse_survey_responses_url
    assert_response :success
  end

  test "should get new" do
    get new_pulse_survey_response_url
    assert_response :success
  end

  test "should create pulse_survey_response" do
    assert_difference("PulseSurveyResponse.count") do
      post pulse_survey_responses_url, params: { pulse_survey_response: { annon_id: @pulse_survey_response.annon_id, pulse_survey_id: @pulse_survey_response.pulse_survey_id, responder_id: @pulse_survey_response.responder_id, submitted_on: @pulse_survey_response.submitted_on } }
    end

    assert_redirected_to pulse_survey_response_url(PulseSurveyResponse.last)
  end

  test "should show pulse_survey_response" do
    get pulse_survey_response_url(@pulse_survey_response)
    assert_response :success
  end

  test "should get edit" do
    get edit_pulse_survey_response_url(@pulse_survey_response)
    assert_response :success
  end

  test "should update pulse_survey_response" do
    patch pulse_survey_response_url(@pulse_survey_response), params: { pulse_survey_response: { annon_id: @pulse_survey_response.annon_id, pulse_survey_id: @pulse_survey_response.pulse_survey_id, responder_id: @pulse_survey_response.responder_id, submitted_on: @pulse_survey_response.submitted_on } }
    assert_redirected_to pulse_survey_response_url(@pulse_survey_response)
  end

  test "should destroy pulse_survey_response" do
    assert_difference("PulseSurveyResponse.count", -1) do
      delete pulse_survey_response_url(@pulse_survey_response)
    end

    assert_redirected_to pulse_survey_responses_url
  end
end
