require "application_system_test_case"

class InterviewFeedbacksTest < ApplicationSystemTestCase
  setup do
    @interview_feedback = interview_feedbacks(:one)
  end

  test "visiting the index" do
    visit interview_feedbacks_url
    assert_selector "h1", text: "Interview feedbacks"
  end

  test "should create interview feedback" do
    visit interview_feedbacks_url
    click_on "New interview feedback"

    fill_in "Interview", with: @interview_feedback.interview_id
    fill_in "Interviewer", with: @interview_feedback.interviewer_id
    fill_in "Notes", with: @interview_feedback.notes
    fill_in "Status", with: @interview_feedback.status
    click_on "Create Interview feedback"

    assert_text "Interview feedback was successfully created"
    click_on "Back"
  end

  test "should update Interview feedback" do
    visit interview_feedback_url(@interview_feedback)
    click_on "Edit this interview feedback", match: :first

    fill_in "Interview", with: @interview_feedback.interview_id
    fill_in "Interviewer", with: @interview_feedback.interviewer_id
    fill_in "Notes", with: @interview_feedback.notes
    fill_in "Status", with: @interview_feedback.status
    click_on "Update Interview feedback"

    assert_text "Interview feedback was successfully updated"
    click_on "Back"
  end

  test "should destroy Interview feedback" do
    visit interview_feedback_url(@interview_feedback)
    click_on "Destroy this interview feedback", match: :first

    assert_text "Interview feedback was successfully destroyed"
  end
end
