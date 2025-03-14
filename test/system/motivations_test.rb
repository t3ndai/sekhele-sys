require "application_system_test_case"

class MotivationsTest < ApplicationSystemTestCase
  setup do
    @motivation = motivations(:one)
  end

  test "visiting the index" do
    visit motivations_url
    assert_selector "h1", text: "Motivations"
  end

  test "should create motivation" do
    visit motivations_url
    click_on "New motivation"

    fill_in "Description", with: @motivation.description
    fill_in "Name", with: @motivation.name
    fill_in "Personal development plan", with: @motivation.personal_development_plan_id
    click_on "Create Motivation"

    assert_text "Motivation was successfully created"
    click_on "Back"
  end

  test "should update Motivation" do
    visit motivation_url(@motivation)
    click_on "Edit this motivation", match: :first

    fill_in "Description", with: @motivation.description
    fill_in "Name", with: @motivation.name
    fill_in "Personal development plan", with: @motivation.personal_development_plan_id
    click_on "Update Motivation"

    assert_text "Motivation was successfully updated"
    click_on "Back"
  end

  test "should destroy Motivation" do
    visit motivation_url(@motivation)
    click_on "Destroy this motivation", match: :first

    assert_text "Motivation was successfully destroyed"
  end
end
