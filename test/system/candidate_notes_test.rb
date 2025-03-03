require "application_system_test_case"

class CandidateNotesTest < ApplicationSystemTestCase
  setup do
    @candidate_note = candidate_notes(:one)
  end

  test "visiting the index" do
    visit candidate_notes_url
    assert_selector "h1", text: "Candidate notes"
  end

  test "should create candidate note" do
    visit candidate_notes_url
    click_on "New candidate note"

    fill_in "Employee", with: @candidate_note.employee_id
    fill_in "Job applicant", with: @candidate_note.job_applicant_id
    fill_in "Note", with: @candidate_note.note
    click_on "Create Candidate note"

    assert_text "Candidate note was successfully created"
    click_on "Back"
  end

  test "should update Candidate note" do
    visit candidate_note_url(@candidate_note)
    click_on "Edit this candidate note", match: :first

    fill_in "Employee", with: @candidate_note.employee_id
    fill_in "Job applicant", with: @candidate_note.job_applicant_id
    fill_in "Note", with: @candidate_note.note
    click_on "Update Candidate note"

    assert_text "Candidate note was successfully updated"
    click_on "Back"
  end

  test "should destroy Candidate note" do
    visit candidate_note_url(@candidate_note)
    click_on "Destroy this candidate note", match: :first

    assert_text "Candidate note was successfully destroyed"
  end
end
