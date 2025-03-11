require "test_helper"

class PerformanceReviewResponsesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @performance_review_response = performance_review_responses(:one)
  end

  test "should get index" do
    get performance_review_responses_url
    assert_response :success
  end

  test "should get new" do
    get new_performance_review_response_url
    assert_response :success
  end

  test "should create performance_review_response" do
    assert_difference("PerformanceReviewResponse.count") do
      post performance_review_responses_url, params: { performance_review_response: { performance_review_id: @performance_review_response.performance_review_id, response: @performance_review_response.response, reviewee_id: @performance_review_response.reviewee_id, reviewer_id: @performance_review_response.reviewer_id, status: @performance_review_response.status, submitted_on: @performance_review_response.submitted_on } }
    end

    assert_redirected_to performance_review_response_url(PerformanceReviewResponse.last)
  end

  test "should show performance_review_response" do
    get performance_review_response_url(@performance_review_response)
    assert_response :success
  end

  test "should get edit" do
    get edit_performance_review_response_url(@performance_review_response)
    assert_response :success
  end

  test "should update performance_review_response" do
    patch performance_review_response_url(@performance_review_response), params: { performance_review_response: { performance_review_id: @performance_review_response.performance_review_id, response: @performance_review_response.response, reviewee_id: @performance_review_response.reviewee_id, reviewer_id: @performance_review_response.reviewer_id, status: @performance_review_response.status, submitted_on: @performance_review_response.submitted_on } }
    assert_redirected_to performance_review_response_url(@performance_review_response)
  end

  test "should destroy performance_review_response" do
    assert_difference("PerformanceReviewResponse.count", -1) do
      delete performance_review_response_url(@performance_review_response)
    end

    assert_redirected_to performance_review_responses_url
  end
end
