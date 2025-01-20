require "test_helper"

class EmployeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employee = employees(:one)
  end

  test "should get index" do
    get employees_url
    assert_response :success
  end

  test "should get new" do
    get new_employee_url
    assert_response :success
  end

  test "should create employee" do
    assert_difference("Employee.count") do
      post employees_url, params: { employee: { addr_line1: @employee.addr_line1, addr_line2: @employee.addr_line2, addr_line3: @employee.addr_line3, addr_postcode: @employee.addr_postcode, city: @employee.city, country: @employee.country, dob: @employee.dob, employement_id: @employee.employement_id, first_name: @employee.first_name, hire_date: @employee.hire_date, id_number: @employee.id_number, last_name: @employee.last_name, nationality: @employee.nationality, passport_number: @employee.passport_number, personal_email: @employee.personal_email, phone1: @employee.phone1, phone2: @employee.phone2, preferred_name: @employee.preferred_name, work_email: @employee.work_email } }
    end

    assert_redirected_to employee_url(Employee.last)
  end

  test "should show employee" do
    get employee_url(@employee)
    assert_response :success
  end

  test "should get edit" do
    get edit_employee_url(@employee)
    assert_response :success
  end

  test "should update employee" do
    patch employee_url(@employee), params: { employee: { addr_line1: @employee.addr_line1, addr_line2: @employee.addr_line2, addr_line3: @employee.addr_line3, addr_postcode: @employee.addr_postcode, city: @employee.city, country: @employee.country, dob: @employee.dob, employement_id: @employee.employement_id, first_name: @employee.first_name, hire_date: @employee.hire_date, id_number: @employee.id_number, last_name: @employee.last_name, nationality: @employee.nationality, passport_number: @employee.passport_number, personal_email: @employee.personal_email, phone1: @employee.phone1, phone2: @employee.phone2, preferred_name: @employee.preferred_name, work_email: @employee.work_email } }
    assert_redirected_to employee_url(@employee)
  end

  test "should destroy employee" do
    assert_difference("Employee.count", -1) do
      delete employee_url(@employee)
    end

    assert_redirected_to employees_url
  end
end
