require "application_system_test_case"

class JobFunctionsTest < ApplicationSystemTestCase
  setup do
    @job_function = job_functions(:one)
  end

  test "visiting the index" do
    visit job_functions_url
    assert_selector "h1", text: "Job functions"
  end

  test "should create job function" do
    visit job_functions_url
    click_on "New job function"

    fill_in "Department", with: @job_function.department_id
    fill_in "Organization", with: @job_function.organization_id
    fill_in "Salary range", with: @job_function.salary_range
    fill_in "Title", with: @job_function.title
    click_on "Create Job function"

    assert_text "Job function was successfully created"
    click_on "Back"
  end

  test "should update Job function" do
    visit job_function_url(@job_function)
    click_on "Edit this job function", match: :first

    fill_in "Department", with: @job_function.department_id
    fill_in "Organization", with: @job_function.organization_id
    fill_in "Salary range", with: @job_function.salary_range
    fill_in "Title", with: @job_function.title
    click_on "Update Job function"

    assert_text "Job function was successfully updated"
    click_on "Back"
  end

  test "should destroy Job function" do
    visit job_function_url(@job_function)
    click_on "Destroy this job function", match: :first

    assert_text "Job function was successfully destroyed"
  end
end
