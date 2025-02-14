require "application_system_test_case"

class LeaveCategoriesTest < ApplicationSystemTestCase
  setup do
    @leave_category = leave_categories(:one)
  end

  test "visiting the index" do
    visit leave_categories_url
    assert_selector "h1", text: "Leave categories"
  end

  test "should create leave category" do
    visit leave_categories_url
    click_on "New leave category"

    fill_in "Name", with: @leave_category.name
    fill_in "Organization", with: @leave_category.organization_id
    click_on "Create Leave category"

    assert_text "Leave category was successfully created"
    click_on "Back"
  end

  test "should update Leave category" do
    visit leave_category_url(@leave_category)
    click_on "Edit this leave category", match: :first

    fill_in "Name", with: @leave_category.name
    fill_in "Organization", with: @leave_category.organization_id
    click_on "Update Leave category"

    assert_text "Leave category was successfully updated"
    click_on "Back"
  end

  test "should destroy Leave category" do
    visit leave_category_url(@leave_category)
    click_on "Destroy this leave category", match: :first

    assert_text "Leave category was successfully destroyed"
  end
end
