require "application_system_test_case"

class OnboardChecklistsTest < ApplicationSystemTestCase
  setup do
    @onboard_checklist = onboard_checklists(:one)
  end

  test "visiting the index" do
    visit onboard_checklists_url
    assert_selector "h1", text: "Onboard checklists"
  end

  test "should create onboard checklist" do
    visit onboard_checklists_url
    click_on "New onboard checklist"

    fill_in "Name", with: @onboard_checklist.name
    fill_in "New joiner", with: @onboard_checklist.new_joiner_id
    click_on "Create Onboard checklist"

    assert_text "Onboard checklist was successfully created"
    click_on "Back"
  end

  test "should update Onboard checklist" do
    visit onboard_checklist_url(@onboard_checklist)
    click_on "Edit this onboard checklist", match: :first

    fill_in "Name", with: @onboard_checklist.name
    fill_in "New joiner", with: @onboard_checklist.new_joiner_id
    click_on "Update Onboard checklist"

    assert_text "Onboard checklist was successfully updated"
    click_on "Back"
  end

  test "should destroy Onboard checklist" do
    visit onboard_checklist_url(@onboard_checklist)
    click_on "Destroy this onboard checklist", match: :first

    assert_text "Onboard checklist was successfully destroyed"
  end
end
