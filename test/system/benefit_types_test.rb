require "application_system_test_case"

class BenefitTypesTest < ApplicationSystemTestCase
  setup do
    @benefit_type = benefit_types(:one)
  end

  test "visiting the index" do
    visit benefit_types_url
    assert_selector "h1", text: "Benefit types"
  end

  test "should create benefit type" do
    visit benefit_types_url
    click_on "New benefit type"

    fill_in "Name", with: @benefit_type.name
    fill_in "Organization", with: @benefit_type.organization_id
    click_on "Create Benefit type"

    assert_text "Benefit type was successfully created"
    click_on "Back"
  end

  test "should update Benefit type" do
    visit benefit_type_url(@benefit_type)
    click_on "Edit this benefit type", match: :first

    fill_in "Name", with: @benefit_type.name
    fill_in "Organization", with: @benefit_type.organization_id
    click_on "Update Benefit type"

    assert_text "Benefit type was successfully updated"
    click_on "Back"
  end

  test "should destroy Benefit type" do
    visit benefit_type_url(@benefit_type)
    click_on "Destroy this benefit type", match: :first

    assert_text "Benefit type was successfully destroyed"
  end
end
