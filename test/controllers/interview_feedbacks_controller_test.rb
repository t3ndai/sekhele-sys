require "test_helper"

class InterviewFeedbacksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @interview_feedback = interview_feedbacks(:one)
  end

  test "should get index" do
    get interview_feedbacks_url
    assert_response :success
  end

  test "should get new" do
    get new_interview_feedback_url
    assert_response :success
  end

  test "should create interview_feedback" do
    assert_difference("InterviewFeedback.count") do
      post interview_feedbacks_url, params: { interview_feedback: { interview_id: @interview_feedback.interview_id, interviewer_id: @interview_feedback.interviewer_id, notes: @interview_feedback.notes, status: @interview_feedback.status } }
    end

    assert_redirected_to interview_feedback_url(InterviewFeedback.last)
  end

  test "should show interview_feedback" do
    get interview_feedback_url(@interview_feedback)
    assert_response :success
  end

  test "should get edit" do
    get edit_interview_feedback_url(@interview_feedback)
    assert_response :success
  end

  test "should update interview_feedback" do
    patch interview_feedback_url(@interview_feedback), params: { interview_feedback: { interview_id: @interview_feedback.interview_id, interviewer_id: @interview_feedback.interviewer_id, notes: @interview_feedback.notes, status: @interview_feedback.status } }
    assert_redirected_to interview_feedback_url(@interview_feedback)
  end

  test "should destroy interview_feedback" do
    assert_difference("InterviewFeedback.count", -1) do
      delete interview_feedback_url(@interview_feedback)
    end

    assert_redirected_to interview_feedbacks_url
  end
end
