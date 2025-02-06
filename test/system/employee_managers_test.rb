require "application_system_test_case"

class EmployeeManagersTest < ApplicationSystemTestCase
  setup do
    @employee_manager = employee_managers(:one)
  end

  test "visiting the index" do
    visit employee_managers_url
    assert_selector "h1", text: "Employee managers"
  end

  test "should create employee manager" do
    visit employee_managers_url
    click_on "New employee manager"

    click_on "Create Employee manager"

    assert_text "Employee manager was successfully created"
    click_on "Back"
  end

  test "should update Employee manager" do
    visit employee_manager_url(@employee_manager)
    click_on "Edit this employee manager", match: :first

    click_on "Update Employee manager"

    assert_text "Employee manager was successfully updated"
    click_on "Back"
  end

  test "should destroy Employee manager" do
    visit employee_manager_url(@employee_manager)
    click_on "Destroy this employee manager", match: :first

    assert_text "Employee manager was successfully destroyed"
  end
end
