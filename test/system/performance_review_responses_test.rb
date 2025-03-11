require "application_system_test_case"

class PerformanceReviewResponsesTest < ApplicationSystemTestCase
  setup do
    @performance_review_response = performance_review_responses(:one)
  end

  test "visiting the index" do
    visit performance_review_responses_url
    assert_selector "h1", text: "Performance review responses"
  end

  test "should create performance review response" do
    visit performance_review_responses_url
    click_on "New performance review response"

    fill_in "Performance review", with: @performance_review_response.performance_review_id
    fill_in "Response", with: @performance_review_response.response
    fill_in "Reviewee", with: @performance_review_response.reviewee_id
    fill_in "Reviewer", with: @performance_review_response.reviewer_id
    fill_in "Status", with: @performance_review_response.status
    fill_in "Submitted on", with: @performance_review_response.submitted_on
    click_on "Create Performance review response"

    assert_text "Performance review response was successfully created"
    click_on "Back"
  end

  test "should update Performance review response" do
    visit performance_review_response_url(@performance_review_response)
    click_on "Edit this performance review response", match: :first

    fill_in "Performance review", with: @performance_review_response.performance_review_id
    fill_in "Response", with: @performance_review_response.response
    fill_in "Reviewee", with: @performance_review_response.reviewee_id
    fill_in "Reviewer", with: @performance_review_response.reviewer_id
    fill_in "Status", with: @performance_review_response.status
    fill_in "Submitted on", with: @performance_review_response.submitted_on
    click_on "Update Performance review response"

    assert_text "Performance review response was successfully updated"
    click_on "Back"
  end

  test "should destroy Performance review response" do
    visit performance_review_response_url(@performance_review_response)
    click_on "Destroy this performance review response", match: :first

    assert_text "Performance review response was successfully destroyed"
  end
end
