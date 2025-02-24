require "test_helper"

class EmployeeBenefitsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get employee_benefits_index_url
    assert_response :success
  end

  test "should get show_benefit" do
    get employee_benefits_show_benefit_url
    assert_response :success
  end

  test "should get show_benefit_plan" do
    get employee_benefits_show_benefit_plan_url
    assert_response :success
  end
end
