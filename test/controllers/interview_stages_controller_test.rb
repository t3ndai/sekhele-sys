require "test_helper"

class InterviewStagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @interview_stage = interview_stages(:one)
  end

  test "should get index" do
    get interview_stages_url
    assert_response :success
  end

  test "should get new" do
    get new_interview_stage_url
    assert_response :success
  end

  test "should create interview_stage" do
    assert_difference("InterviewStage.count") do
      post interview_stages_url, params: { interview_stage: { mandatory: @interview_stage.mandatory, name: @interview_stage.name, organization_id: @interview_stage.organization_id } }
    end

    assert_redirected_to interview_stage_url(InterviewStage.last)
  end

  test "should show interview_stage" do
    get interview_stage_url(@interview_stage)
    assert_response :success
  end

  test "should get edit" do
    get edit_interview_stage_url(@interview_stage)
    assert_response :success
  end

  test "should update interview_stage" do
    patch interview_stage_url(@interview_stage), params: { interview_stage: { mandatory: @interview_stage.mandatory, name: @interview_stage.name, organization_id: @interview_stage.organization_id } }
    assert_redirected_to interview_stage_url(@interview_stage)
  end

  test "should destroy interview_stage" do
    assert_difference("InterviewStage.count", -1) do
      delete interview_stage_url(@interview_stage)
    end

    assert_redirected_to interview_stages_url
  end
end
