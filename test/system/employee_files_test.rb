require "application_system_test_case"

class EmployeeFilesTest < ApplicationSystemTestCase
  setup do
    @employee_file = employee_files(:one)
  end

  test "visiting the index" do
    visit employee_files_url
    assert_selector "h1", text: "Employee files"
  end

  test "should create employee file" do
    visit employee_files_url
    click_on "New employee file"

    fill_in "Document", with: @employee_file.document_id
    fill_in "Employee", with: @employee_file.employee_id
    click_on "Create Employee file"

    assert_text "Employee file was successfully created"
    click_on "Back"
  end

  test "should update Employee file" do
    visit employee_file_url(@employee_file)
    click_on "Edit this employee file", match: :first

    fill_in "Document", with: @employee_file.document_id
    fill_in "Employee", with: @employee_file.employee_id
    click_on "Update Employee file"

    assert_text "Employee file was successfully updated"
    click_on "Back"
  end

  test "should destroy Employee file" do
    visit employee_file_url(@employee_file)
    click_on "Destroy this employee file", match: :first

    assert_text "Employee file was successfully destroyed"
  end
end
