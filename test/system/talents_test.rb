require "application_system_test_case"

class TalentsTest < ApplicationSystemTestCase
  setup do
    @talent = talents(:one)
  end

  test "visiting the index" do
    visit talents_url
    assert_selector "h1", text: "Talents"
  end

  test "should create talent" do
    visit talents_url
    click_on "New talent"

    fill_in "Description", with: @talent.description
    fill_in "Name", with: @talent.name
    fill_in "Personal development plan", with: @talent.personal_development_plan_id
    click_on "Create Talent"

    assert_text "Talent was successfully created"
    click_on "Back"
  end

  test "should update Talent" do
    visit talent_url(@talent)
    click_on "Edit this talent", match: :first

    fill_in "Description", with: @talent.description
    fill_in "Name", with: @talent.name
    fill_in "Personal development plan", with: @talent.personal_development_plan_id
    click_on "Update Talent"

    assert_text "Talent was successfully updated"
    click_on "Back"
  end

  test "should destroy Talent" do
    visit talent_url(@talent)
    click_on "Destroy this talent", match: :first

    assert_text "Talent was successfully destroyed"
  end
end
