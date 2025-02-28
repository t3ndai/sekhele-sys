require "application_system_test_case"

class InterviewersTest < ApplicationSystemTestCase
  setup do
    @interviewer = interviewers(:one)
  end

  test "visiting the index" do
    visit interviewers_url
    assert_selector "h1", text: "Interviewers"
  end

  test "should create interviewer" do
    visit interviewers_url
    click_on "New interviewer"

    fill_in "Assigned on", with: @interviewer.assigned_on
    fill_in "Employee", with: @interviewer.employee_id
    fill_in "Interview", with: @interviewer.interview_id
    click_on "Create Interviewer"

    assert_text "Interviewer was successfully created"
    click_on "Back"
  end

  test "should update Interviewer" do
    visit interviewer_url(@interviewer)
    click_on "Edit this interviewer", match: :first

    fill_in "Assigned on", with: @interviewer.assigned_on
    fill_in "Employee", with: @interviewer.employee_id
    fill_in "Interview", with: @interviewer.interview_id
    click_on "Update Interviewer"

    assert_text "Interviewer was successfully updated"
    click_on "Back"
  end

  test "should destroy Interviewer" do
    visit interviewer_url(@interviewer)
    click_on "Destroy this interviewer", match: :first

    assert_text "Interviewer was successfully destroyed"
  end
end
