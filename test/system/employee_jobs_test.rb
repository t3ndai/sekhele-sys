require "application_system_test_case"

class EmployeeJobsTest < ApplicationSystemTestCase
  setup do
    @employee_job = employee_jobs(:one)
  end

  test "visiting the index" do
    visit employee_jobs_url
    assert_selector "h1", text: "Employee jobs"
  end

  test "should create employee job" do
    visit employee_jobs_url
    click_on "New employee job"

    fill_in "Employee", with: @employee_job.employee_id
    fill_in "Ended on", with: @employee_job.ended_on
    fill_in "Job function", with: @employee_job.job_function_id
    fill_in "Job level", with: @employee_job.job_level_id
    fill_in "Started on", with: @employee_job.started_on
    click_on "Create Employee job"

    assert_text "Employee job was successfully created"
    click_on "Back"
  end

  test "should update Employee job" do
    visit employee_job_url(@employee_job)
    click_on "Edit this employee job", match: :first

    fill_in "Employee", with: @employee_job.employee_id
    fill_in "Ended on", with: @employee_job.ended_on
    fill_in "Job function", with: @employee_job.job_function_id
    fill_in "Job level", with: @employee_job.job_level_id
    fill_in "Started on", with: @employee_job.started_on
    click_on "Update Employee job"

    assert_text "Employee job was successfully updated"
    click_on "Back"
  end

  test "should destroy Employee job" do
    visit employee_job_url(@employee_job)
    click_on "Destroy this employee job", match: :first

    assert_text "Employee job was successfully destroyed"
  end
end
