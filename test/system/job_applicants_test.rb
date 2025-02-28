require "application_system_test_case"

class JobApplicantsTest < ApplicationSystemTestCase
  setup do
    @job_applicant = job_applicants(:one)
  end

  test "visiting the index" do
    visit job_applicants_url
    assert_selector "h1", text: "Job applicants"
  end

  test "should create job applicant" do
    visit job_applicants_url
    click_on "New job applicant"

    fill_in "Applied on", with: @job_applicant.applied_on
    fill_in "Email", with: @job_applicant.email
    fill_in "First name", with: @job_applicant.first_name
    fill_in "Job posting", with: @job_applicant.job_posting_id
    fill_in "Last name", with: @job_applicant.last_name
    fill_in "Middle name", with: @job_applicant.middle_name
    fill_in "Phone", with: @job_applicant.phone
    click_on "Create Job applicant"

    assert_text "Job applicant was successfully created"
    click_on "Back"
  end

  test "should update Job applicant" do
    visit job_applicant_url(@job_applicant)
    click_on "Edit this job applicant", match: :first

    fill_in "Applied on", with: @job_applicant.applied_on
    fill_in "Email", with: @job_applicant.email
    fill_in "First name", with: @job_applicant.first_name
    fill_in "Job posting", with: @job_applicant.job_posting_id
    fill_in "Last name", with: @job_applicant.last_name
    fill_in "Middle name", with: @job_applicant.middle_name
    fill_in "Phone", with: @job_applicant.phone
    click_on "Update Job applicant"

    assert_text "Job applicant was successfully updated"
    click_on "Back"
  end

  test "should destroy Job applicant" do
    visit job_applicant_url(@job_applicant)
    click_on "Destroy this job applicant", match: :first

    assert_text "Job applicant was successfully destroyed"
  end
end
