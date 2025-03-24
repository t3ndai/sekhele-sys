require "test_helper"

class EmployeeDashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get employee_dashboard_show_url
    assert_response :success
  end
end
