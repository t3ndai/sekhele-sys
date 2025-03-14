require "application_system_test_case"

class PersonalDevelopmentPlansTest < ApplicationSystemTestCase
  setup do
    @personal_development_plan = personal_development_plans(:one)
  end

  test "visiting the index" do
    visit personal_development_plans_url
    assert_selector "h1", text: "Personal development plans"
  end

  test "should create personal development plan" do
    visit personal_development_plans_url
    click_on "New personal development plan"

    fill_in "Employee", with: @personal_development_plan.employee_id
    fill_in "Name", with: @personal_development_plan.name
    click_on "Create Personal development plan"

    assert_text "Personal development plan was successfully created"
    click_on "Back"
  end

  test "should update Personal development plan" do
    visit personal_development_plan_url(@personal_development_plan)
    click_on "Edit this personal development plan", match: :first

    fill_in "Employee", with: @personal_development_plan.employee_id
    fill_in "Name", with: @personal_development_plan.name
    click_on "Update Personal development plan"

    assert_text "Personal development plan was successfully updated"
    click_on "Back"
  end

  test "should destroy Personal development plan" do
    visit personal_development_plan_url(@personal_development_plan)
    click_on "Destroy this personal development plan", match: :first

    assert_text "Personal development plan was successfully destroyed"
  end
end
