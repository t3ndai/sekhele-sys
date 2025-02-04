require "test_helper"

class EmployeeFilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employee_file = employee_files(:one)
  end

  test "should get index" do
    get employee_files_url
    assert_response :success
  end

  test "should get new" do
    get new_employee_file_url
    assert_response :success
  end

  test "should create employee_file" do
    assert_difference("EmployeeFile.count") do
      post employee_files_url, params: { employee_file: { document_id: @employee_file.document_id, employee_id: @employee_file.employee_id } }
    end

    assert_redirected_to employee_file_url(EmployeeFile.last)
  end

  test "should show employee_file" do
    get employee_file_url(@employee_file)
    assert_response :success
  end

  test "should get edit" do
    get edit_employee_file_url(@employee_file)
    assert_response :success
  end

  test "should update employee_file" do
    patch employee_file_url(@employee_file), params: { employee_file: { document_id: @employee_file.document_id, employee_id: @employee_file.employee_id } }
    assert_redirected_to employee_file_url(@employee_file)
  end

  test "should destroy employee_file" do
    assert_difference("EmployeeFile.count", -1) do
      delete employee_file_url(@employee_file)
    end

    assert_redirected_to employee_files_url
  end
end
