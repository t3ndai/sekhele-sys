require "test_helper"

class PersonalDevelopmentPlansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @personal_development_plan = personal_development_plans(:one)
  end

  test "should get index" do
    get personal_development_plans_url
    assert_response :success
  end

  test "should get new" do
    get new_personal_development_plan_url
    assert_response :success
  end

  test "should create personal_development_plan" do
    assert_difference("PersonalDevelopmentPlan.count") do
      post personal_development_plans_url, params: { personal_development_plan: { employee_id: @personal_development_plan.employee_id, name: @personal_development_plan.name } }
    end

    assert_redirected_to personal_development_plan_url(PersonalDevelopmentPlan.last)
  end

  test "should show personal_development_plan" do
    get personal_development_plan_url(@personal_development_plan)
    assert_response :success
  end

  test "should get edit" do
    get edit_personal_development_plan_url(@personal_development_plan)
    assert_response :success
  end

  test "should update personal_development_plan" do
    patch personal_development_plan_url(@personal_development_plan), params: { personal_development_plan: { employee_id: @personal_development_plan.employee_id, name: @personal_development_plan.name } }
    assert_redirected_to personal_development_plan_url(@personal_development_plan)
  end

  test "should destroy personal_development_plan" do
    assert_difference("PersonalDevelopmentPlan.count", -1) do
      delete personal_development_plan_url(@personal_development_plan)
    end

    assert_redirected_to personal_development_plans_url
  end
end
