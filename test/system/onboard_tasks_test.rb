require "application_system_test_case"

class OnboardTasksTest < ApplicationSystemTestCase
  setup do
    @onboard_task = onboard_tasks(:one)
  end

  test "visiting the index" do
    visit onboard_tasks_url
    assert_selector "h1", text: "Onboard tasks"
  end

  test "should create onboard task" do
    visit onboard_tasks_url
    click_on "New onboard task"

    fill_in "Assignee", with: @onboard_task.assignee_id
    fill_in "Due on", with: @onboard_task.due_on
    fill_in "Name", with: @onboard_task.name
    fill_in "Tags", with: @onboard_task.tags
    click_on "Create Onboard task"

    assert_text "Onboard task was successfully created"
    click_on "Back"
  end

  test "should update Onboard task" do
    visit onboard_task_url(@onboard_task)
    click_on "Edit this onboard task", match: :first

    fill_in "Assignee", with: @onboard_task.assignee_id
    fill_in "Due on", with: @onboard_task.due_on
    fill_in "Name", with: @onboard_task.name
    fill_in "Tags", with: @onboard_task.tags
    click_on "Update Onboard task"

    assert_text "Onboard task was successfully updated"
    click_on "Back"
  end

  test "should destroy Onboard task" do
    visit onboard_task_url(@onboard_task)
    click_on "Destroy this onboard task", match: :first

    assert_text "Onboard task was successfully destroyed"
  end
end
