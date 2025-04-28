require "test_helper"

class EmployeePaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employee_pay = employee_pays(:one)
  end

  test "should get index" do
    get employee_pays_url
    assert_response :success
  end

  test "should get new" do
    get new_employee_pay_url
    assert_response :success
  end

  test "should create employee_pay" do
    assert_difference("EmployeePay.count") do
      post employee_pays_url, params: { employee_pay: { amount: @employee_pay.amount, currency: @employee_pay.currency, employee_id: @employee_pay.employee_id, end_date: @employee_pay.end_date, frequency: @employee_pay.frequency, pay_type: @employee_pay.pay_type, start_date: @employee_pay.start_date } }
    end

    assert_redirected_to employee_pay_url(EmployeePay.last)
  end

  test "should show employee_pay" do
    get employee_pay_url(@employee_pay)
    assert_response :success
  end

  test "should get edit" do
    get edit_employee_pay_url(@employee_pay)
    assert_response :success
  end

  test "should update employee_pay" do
    patch employee_pay_url(@employee_pay), params: { employee_pay: { amount: @employee_pay.amount, currency: @employee_pay.currency, employee_id: @employee_pay.employee_id, end_date: @employee_pay.end_date, frequency: @employee_pay.frequency, pay_type: @employee_pay.pay_type, start_date: @employee_pay.start_date } }
    assert_redirected_to employee_pay_url(@employee_pay)
  end

  test "should destroy employee_pay" do
    assert_difference("EmployeePay.count", -1) do
      delete employee_pay_url(@employee_pay)
    end

    assert_redirected_to employee_pays_url
  end
end
