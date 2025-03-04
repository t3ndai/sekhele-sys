require "application_system_test_case"

class MilestonesTest < ApplicationSystemTestCase
  setup do
    @milestone = milestones(:one)
  end

  test "visiting the index" do
    visit milestones_url
    assert_selector "h1", text: "Milestones"
  end

  test "should create milestone" do
    visit milestones_url
    click_on "New milestone"

    fill_in "Completed on", with: @milestone.completed_on
    fill_in "Description", with: @milestone.description
    fill_in "Goal", with: @milestone.goal_id
    fill_in "Name", with: @milestone.name
    fill_in "Started on", with: @milestone.started_on
    click_on "Create Milestone"

    assert_text "Milestone was successfully created"
    click_on "Back"
  end

  test "should update Milestone" do
    visit milestone_url(@milestone)
    click_on "Edit this milestone", match: :first

    fill_in "Completed on", with: @milestone.completed_on
    fill_in "Description", with: @milestone.description
    fill_in "Goal", with: @milestone.goal_id
    fill_in "Name", with: @milestone.name
    fill_in "Started on", with: @milestone.started_on
    click_on "Update Milestone"

    assert_text "Milestone was successfully updated"
    click_on "Back"
  end

  test "should destroy Milestone" do
    visit milestone_url(@milestone)
    click_on "Destroy this milestone", match: :first

    assert_text "Milestone was successfully destroyed"
  end
end
