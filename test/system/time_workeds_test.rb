require "application_system_test_case"

class TimeWorkedsTest < ApplicationSystemTestCase
  setup do
    @time_worked = time_workeds(:one)
  end

  test "visiting the index" do
    visit time_workeds_url
    assert_selector "h1", text: "Time workeds"
  end

  test "should create time worked" do
    visit time_workeds_url
    click_on "New time worked"

    fill_in "Day", with: @time_worked.day
    fill_in "Employee", with: @time_worked.employee_id
    fill_in "End time", with: @time_worked.end_time
    fill_in "Note", with: @time_worked.note
    fill_in "Start time", with: @time_worked.start_time
    click_on "Create Time worked"

    assert_text "Time worked was successfully created"
    click_on "Back"
  end

  test "should update Time worked" do
    visit time_worked_url(@time_worked)
    click_on "Edit this time worked", match: :first

    fill_in "Day", with: @time_worked.day
    fill_in "Employee", with: @time_worked.employee_id
    fill_in "End time", with: @time_worked.end_time.to_s
    fill_in "Note", with: @time_worked.note
    fill_in "Start time", with: @time_worked.start_time.to_s
    click_on "Update Time worked"

    assert_text "Time worked was successfully updated"
    click_on "Back"
  end

  test "should destroy Time worked" do
    visit time_worked_url(@time_worked)
    click_on "Destroy this time worked", match: :first

    assert_text "Time worked was successfully destroyed"
  end
end
