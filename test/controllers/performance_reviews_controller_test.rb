require "test_helper"

class PerformanceReviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @performance_review = performance_reviews(:one)
  end

  test "should get index" do
    get performance_reviews_url
    assert_response :success
  end

  test "should get new" do
    get new_performance_review_url
    assert_response :success
  end

  test "should create performance_review" do
    assert_difference("PerformanceReview.count") do
      post performance_reviews_url, params: { performance_review: { closes_on: @performance_review.closes_on, name: @performance_review.name, opens_on: @performance_review.opens_on, organization_id: @performance_review.organization_id, performance_review_type_id: @performance_review.performance_review_type_id } }
    end

    assert_redirected_to performance_review_url(PerformanceReview.last)
  end

  test "should show performance_review" do
    get performance_review_url(@performance_review)
    assert_response :success
  end

  test "should get edit" do
    get edit_performance_review_url(@performance_review)
    assert_response :success
  end

  test "should update performance_review" do
    patch performance_review_url(@performance_review), params: { performance_review: { closes_on: @performance_review.closes_on, name: @performance_review.name, opens_on: @performance_review.opens_on, organization_id: @performance_review.organization_id, performance_review_type_id: @performance_review.performance_review_type_id } }
    assert_redirected_to performance_review_url(@performance_review)
  end

  test "should destroy performance_review" do
    assert_difference("PerformanceReview.count", -1) do
      delete performance_review_url(@performance_review)
    end

    assert_redirected_to performance_reviews_url
  end
end
