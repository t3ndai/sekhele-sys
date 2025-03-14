require "application_system_test_case"

class GrowthAreasTest < ApplicationSystemTestCase
  setup do
    @growth_area = growth_areas(:one)
  end

  test "visiting the index" do
    visit growth_areas_url
    assert_selector "h1", text: "Growth areas"
  end

  test "should create growth area" do
    visit growth_areas_url
    click_on "New growth area"

    fill_in "Description", with: @growth_area.description
    fill_in "Name", with: @growth_area.name
    fill_in "Personal development plan", with: @growth_area.personal_development_plan_id
    click_on "Create Growth area"

    assert_text "Growth area was successfully created"
    click_on "Back"
  end

  test "should update Growth area" do
    visit growth_area_url(@growth_area)
    click_on "Edit this growth area", match: :first

    fill_in "Description", with: @growth_area.description
    fill_in "Name", with: @growth_area.name
    fill_in "Personal development plan", with: @growth_area.personal_development_plan_id
    click_on "Update Growth area"

    assert_text "Growth area was successfully updated"
    click_on "Back"
  end

  test "should destroy Growth area" do
    visit growth_area_url(@growth_area)
    click_on "Destroy this growth area", match: :first

    assert_text "Growth area was successfully destroyed"
  end
end
