require "application_system_test_case"

class BenefitPlansTest < ApplicationSystemTestCase
  setup do
    @benefit_plan = benefit_plans(:one)
  end

  test "visiting the index" do
    visit benefit_plans_url
    assert_selector "h1", text: "Benefit plans"
  end

  test "should create benefit plan" do
    visit benefit_plans_url
    click_on "New benefit plan"

    fill_in "Benefit", with: @benefit_plan.benefit_id
    fill_in "Cover", with: @benefit_plan.cover
    fill_in "Employee contribution", with: @benefit_plan.employee_contribution
    fill_in "Employer contribution", with: @benefit_plan.employer_contribution
    fill_in "Name", with: @benefit_plan.name
    click_on "Create Benefit plan"

    assert_text "Benefit plan was successfully created"
    click_on "Back"
  end

  test "should update Benefit plan" do
    visit benefit_plan_url(@benefit_plan)
    click_on "Edit this benefit plan", match: :first

    fill_in "Benefit", with: @benefit_plan.benefit_id
    fill_in "Cover", with: @benefit_plan.cover
    fill_in "Employee contribution", with: @benefit_plan.employee_contribution
    fill_in "Employer contribution", with: @benefit_plan.employer_contribution
    fill_in "Name", with: @benefit_plan.name
    click_on "Update Benefit plan"

    assert_text "Benefit plan was successfully updated"
    click_on "Back"
  end

  test "should destroy Benefit plan" do
    visit benefit_plan_url(@benefit_plan)
    click_on "Destroy this benefit plan", match: :first

    assert_text "Benefit plan was successfully destroyed"
  end
end
