require "test_helper"

class CandidateNotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @candidate_note = candidate_notes(:one)
  end

  test "should get index" do
    get candidate_notes_url
    assert_response :success
  end

  test "should get new" do
    get new_candidate_note_url
    assert_response :success
  end

  test "should create candidate_note" do
    assert_difference("CandidateNote.count") do
      post candidate_notes_url, params: { candidate_note: { employee_id: @candidate_note.employee_id, job_applicant_id: @candidate_note.job_applicant_id, note: @candidate_note.note } }
    end

    assert_redirected_to candidate_note_url(CandidateNote.last)
  end

  test "should show candidate_note" do
    get candidate_note_url(@candidate_note)
    assert_response :success
  end

  test "should get edit" do
    get edit_candidate_note_url(@candidate_note)
    assert_response :success
  end

  test "should update candidate_note" do
    patch candidate_note_url(@candidate_note), params: { candidate_note: { employee_id: @candidate_note.employee_id, job_applicant_id: @candidate_note.job_applicant_id, note: @candidate_note.note } }
    assert_redirected_to candidate_note_url(@candidate_note)
  end

  test "should destroy candidate_note" do
    assert_difference("CandidateNote.count", -1) do
      delete candidate_note_url(@candidate_note)
    end

    assert_redirected_to candidate_notes_url
  end
end
