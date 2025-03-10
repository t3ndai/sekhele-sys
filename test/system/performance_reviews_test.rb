require "application_system_test_case"

class PerformanceReviewsTest < ApplicationSystemTestCase
  setup do
    @performance_review = performance_reviews(:one)
  end

  test "visiting the index" do
    visit performance_reviews_url
    assert_selector "h1", text: "Performance reviews"
  end

  test "should create performance review" do
    visit performance_reviews_url
    click_on "New performance review"

    fill_in "Closes on", with: @performance_review.closes_on
    fill_in "Name", with: @performance_review.name
    fill_in "Opens on", with: @performance_review.opens_on
    fill_in "Organization", with: @performance_review.organization_id
    fill_in "Performance review type", with: @performance_review.performance_review_type_id
    click_on "Create Performance review"

    assert_text "Performance review was successfully created"
    click_on "Back"
  end

  test "should update Performance review" do
    visit performance_review_url(@performance_review)
    click_on "Edit this performance review", match: :first

    fill_in "Closes on", with: @performance_review.closes_on
    fill_in "Name", with: @performance_review.name
    fill_in "Opens on", with: @performance_review.opens_on
    fill_in "Organization", with: @performance_review.organization_id
    fill_in "Performance review type", with: @performance_review.performance_review_type_id
    click_on "Update Performance review"

    assert_text "Performance review was successfully updated"
    click_on "Back"
  end

  test "should destroy Performance review" do
    visit performance_review_url(@performance_review)
    click_on "Destroy this performance review", match: :first

    assert_text "Performance review was successfully destroyed"
  end
end
