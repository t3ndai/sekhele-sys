require "application_system_test_case"

class CostCentersTest < ApplicationSystemTestCase
  setup do
    @cost_center = cost_centers(:one)
  end

  test "visiting the index" do
    visit cost_centers_url
    assert_selector "h1", text: "Cost centers"
  end

  test "should create cost center" do
    visit cost_centers_url
    click_on "New cost center"

    fill_in "Code", with: @cost_center.code
    fill_in "Description", with: @cost_center.description
    fill_in "Name", with: @cost_center.name
    click_on "Create Cost center"

    assert_text "Cost center was successfully created"
    click_on "Back"
  end

  test "should update Cost center" do
    visit cost_center_url(@cost_center)
    click_on "Edit this cost center", match: :first

    fill_in "Code", with: @cost_center.code
    fill_in "Description", with: @cost_center.description
    fill_in "Name", with: @cost_center.name
    click_on "Update Cost center"

    assert_text "Cost center was successfully updated"
    click_on "Back"
  end

  test "should destroy Cost center" do
    visit cost_center_url(@cost_center)
    click_on "Destroy this cost center", match: :first

    assert_text "Cost center was successfully destroyed"
  end
end
