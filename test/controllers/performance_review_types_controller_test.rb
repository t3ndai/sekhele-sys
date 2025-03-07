require "test_helper"

class PerformanceReviewTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @performance_review_type = performance_review_types(:one)
  end

  test "should get index" do
    get performance_review_types_url
    assert_response :success
  end

  test "should get new" do
    get new_performance_review_type_url
    assert_response :success
  end

  test "should create performance_review_type" do
    assert_difference("PerformanceReviewType.count") do
      post performance_review_types_url, params: { performance_review_type: { name: @performance_review_type.name } }
    end

    assert_redirected_to performance_review_type_url(PerformanceReviewType.last)
  end

  test "should show performance_review_type" do
    get performance_review_type_url(@performance_review_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_performance_review_type_url(@performance_review_type)
    assert_response :success
  end

  test "should update performance_review_type" do
    patch performance_review_type_url(@performance_review_type), params: { performance_review_type: { name: @performance_review_type.name } }
    assert_redirected_to performance_review_type_url(@performance_review_type)
  end

  test "should destroy performance_review_type" do
    assert_difference("PerformanceReviewType.count", -1) do
      delete performance_review_type_url(@performance_review_type)
    end

    assert_redirected_to performance_review_types_url
  end
end
