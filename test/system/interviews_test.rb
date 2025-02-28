require "application_system_test_case"

class InterviewsTest < ApplicationSystemTestCase
  setup do
    @interview = interviews(:one)
  end

  test "visiting the index" do
    visit interviews_url
    assert_selector "h1", text: "Interviews"
  end

  test "should create interview" do
    visit interviews_url
    click_on "New interview"

    fill_in "At", with: @interview.at
    fill_in "Interview stage", with: @interview.interview_stage_id
    fill_in "Job applicant", with: @interview.job_applicant_id
    fill_in "Location", with: @interview.location
    fill_in "Meeting link", with: @interview.meeting_link
    fill_in "Note", with: @interview.note
    fill_in "On", with: @interview.on
    fill_in "Room", with: @interview.room
    click_on "Create Interview"

    assert_text "Interview was successfully created"
    click_on "Back"
  end

  test "should update Interview" do
    visit interview_url(@interview)
    click_on "Edit this interview", match: :first

    fill_in "At", with: @interview.at.to_s
    fill_in "Interview stage", with: @interview.interview_stage_id
    fill_in "Job applicant", with: @interview.job_applicant_id
    fill_in "Location", with: @interview.location
    fill_in "Meeting link", with: @interview.meeting_link
    fill_in "Note", with: @interview.note
    fill_in "On", with: @interview.on
    fill_in "Room", with: @interview.room
    click_on "Update Interview"

    assert_text "Interview was successfully updated"
    click_on "Back"
  end

  test "should destroy Interview" do
    visit interview_url(@interview)
    click_on "Destroy this interview", match: :first

    assert_text "Interview was successfully destroyed"
  end
end
