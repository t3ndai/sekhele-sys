require "test_helper"

class BenefitTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @benefit_type = benefit_types(:one)
  end

  test "should get index" do
    get benefit_types_url
    assert_response :success
  end

  test "should get new" do
    get new_benefit_type_url
    assert_response :success
  end

  test "should create benefit_type" do
    assert_difference("BenefitType.count") do
      post benefit_types_url, params: { benefit_type: { name: @benefit_type.name, organization_id: @benefit_type.organization_id } }
    end

    assert_redirected_to benefit_type_url(BenefitType.last)
  end

  test "should show benefit_type" do
    get benefit_type_url(@benefit_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_benefit_type_url(@benefit_type)
    assert_response :success
  end

  test "should update benefit_type" do
    patch benefit_type_url(@benefit_type), params: { benefit_type: { name: @benefit_type.name, organization_id: @benefit_type.organization_id } }
    assert_redirected_to benefit_type_url(@benefit_type)
  end

  test "should destroy benefit_type" do
    assert_difference("BenefitType.count", -1) do
      delete benefit_type_url(@benefit_type)
    end

    assert_redirected_to benefit_types_url
  end
end
