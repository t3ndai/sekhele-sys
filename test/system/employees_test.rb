require "application_system_test_case"

class EmployeesTest < ApplicationSystemTestCase
  setup do
    @employee = employees(:one)
  end

  test "visiting the index" do
    visit employees_url
    assert_selector "h1", text: "Employees"
  end

  test "should create employee" do
    visit employees_url
    click_on "New employee"

    fill_in "Addr line1", with: @employee.addr_line1
    fill_in "Addr line2", with: @employee.addr_line2
    fill_in "Addr line3", with: @employee.addr_line3
    fill_in "Addr postcode", with: @employee.addr_postcode
    fill_in "City", with: @employee.city
    fill_in "Country", with: @employee.country
    fill_in "Dob", with: @employee.dob
    fill_in "Employement", with: @employee.employement_id
    fill_in "First name", with: @employee.first_name
    fill_in "Hire date", with: @employee.hire_date
    fill_in "Id number", with: @employee.id_number
    fill_in "Last name", with: @employee.last_name
    fill_in "Nationality", with: @employee.nationality
    fill_in "Passport number", with: @employee.passport_number
    fill_in "Personal email", with: @employee.personal_email
    fill_in "Phone1", with: @employee.phone1
    fill_in "Phone2", with: @employee.phone2
    fill_in "Preferred name", with: @employee.preferred_name
    fill_in "Work email", with: @employee.work_email
    click_on "Create Employee"

    assert_text "Employee was successfully created"
    click_on "Back"
  end

  test "should update Employee" do
    visit employee_url(@employee)
    click_on "Edit this employee", match: :first

    fill_in "Addr line1", with: @employee.addr_line1
    fill_in "Addr line2", with: @employee.addr_line2
    fill_in "Addr line3", with: @employee.addr_line3
    fill_in "Addr postcode", with: @employee.addr_postcode
    fill_in "City", with: @employee.city
    fill_in "Country", with: @employee.country
    fill_in "Dob", with: @employee.dob
    fill_in "Employement", with: @employee.employement_id
    fill_in "First name", with: @employee.first_name
    fill_in "Hire date", with: @employee.hire_date
    fill_in "Id number", with: @employee.id_number
    fill_in "Last name", with: @employee.last_name
    fill_in "Nationality", with: @employee.nationality
    fill_in "Passport number", with: @employee.passport_number
    fill_in "Personal email", with: @employee.personal_email
    fill_in "Phone1", with: @employee.phone1
    fill_in "Phone2", with: @employee.phone2
    fill_in "Preferred name", with: @employee.preferred_name
    fill_in "Work email", with: @employee.work_email
    click_on "Update Employee"

    assert_text "Employee was successfully updated"
    click_on "Back"
  end

  test "should destroy Employee" do
    visit employee_url(@employee)
    click_on "Destroy this employee", match: :first

    assert_text "Employee was successfully destroyed"
  end
end
