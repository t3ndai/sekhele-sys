require "application_system_test_case"

class EmployeePaysTest < ApplicationSystemTestCase
  setup do
    @employee_pay = employee_pays(:one)
  end

  test "visiting the index" do
    visit employee_pays_url
    assert_selector "h1", text: "Employee pays"
  end

  test "should create employee pay" do
    visit employee_pays_url
    click_on "New employee pay"

    fill_in "Amount", with: @employee_pay.amount
    fill_in "Currency", with: @employee_pay.currency
    fill_in "Employee", with: @employee_pay.employee_id
    fill_in "End date", with: @employee_pay.end_date
    fill_in "Frequency", with: @employee_pay.frequency
    fill_in "Pay type", with: @employee_pay.pay_type
    fill_in "Start date", with: @employee_pay.start_date
    click_on "Create Employee pay"

    assert_text "Employee pay was successfully created"
    click_on "Back"
  end

  test "should update Employee pay" do
    visit employee_pay_url(@employee_pay)
    click_on "Edit this employee pay", match: :first

    fill_in "Amount", with: @employee_pay.amount
    fill_in "Currency", with: @employee_pay.currency
    fill_in "Employee", with: @employee_pay.employee_id
    fill_in "End date", with: @employee_pay.end_date
    fill_in "Frequency", with: @employee_pay.frequency
    fill_in "Pay type", with: @employee_pay.pay_type
    fill_in "Start date", with: @employee_pay.start_date
    click_on "Update Employee pay"

    assert_text "Employee pay was successfully updated"
    click_on "Back"
  end

  test "should destroy Employee pay" do
    visit employee_pay_url(@employee_pay)
    click_on "Destroy this employee pay", match: :first

    assert_text "Employee pay was successfully destroyed"
  end
end
