require "test_helper"

class EmployeeManagersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employee_manager = employee_managers(:one)
  end

  test "should get index" do
    get employee_managers_url
    assert_response :success
  end

  test "should get new" do
    get new_employee_manager_url
    assert_response :success
  end

  test "should create employee_manager" do
    assert_difference("EmployeeManager.count") do
      post employee_managers_url, params: { employee_manager: {} }
    end

    assert_redirected_to employee_manager_url(EmployeeManager.last)
  end

  test "should show employee_manager" do
    get employee_manager_url(@employee_manager)
    assert_response :success
  end

  test "should get edit" do
    get edit_employee_manager_url(@employee_manager)
    assert_response :success
  end

  test "should update employee_manager" do
    patch employee_manager_url(@employee_manager), params: { employee_manager: {} }
    assert_redirected_to employee_manager_url(@employee_manager)
  end

  test "should destroy employee_manager" do
    assert_difference("EmployeeManager.count", -1) do
      delete employee_manager_url(@employee_manager)
    end

    assert_redirected_to employee_managers_url
  end
end
