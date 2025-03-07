require "application_system_test_case"

class PerformanceReviewTypesTest < ApplicationSystemTestCase
  setup do
    @performance_review_type = performance_review_types(:one)
  end

  test "visiting the index" do
    visit performance_review_types_url
    assert_selector "h1", text: "Performance review types"
  end

  test "should create performance review type" do
    visit performance_review_types_url
    click_on "New performance review type"

    fill_in "Name", with: @performance_review_type.name
    click_on "Create Performance review type"

    assert_text "Performance review type was successfully created"
    click_on "Back"
  end

  test "should update Performance review type" do
    visit performance_review_type_url(@performance_review_type)
    click_on "Edit this performance review type", match: :first

    fill_in "Name", with: @performance_review_type.name
    click_on "Update Performance review type"

    assert_text "Performance review type was successfully updated"
    click_on "Back"
  end

  test "should destroy Performance review type" do
    visit performance_review_type_url(@performance_review_type)
    click_on "Destroy this performance review type", match: :first

    assert_text "Performance review type was successfully destroyed"
  end
end
