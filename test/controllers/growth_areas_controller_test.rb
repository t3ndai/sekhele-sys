require "test_helper"

class GrowthAreasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @growth_area = growth_areas(:one)
  end

  test "should get index" do
    get growth_areas_url
    assert_response :success
  end

  test "should get new" do
    get new_growth_area_url
    assert_response :success
  end

  test "should create growth_area" do
    assert_difference("GrowthArea.count") do
      post growth_areas_url, params: { growth_area: { description: @growth_area.description, name: @growth_area.name, personal_development_plan_id: @growth_area.personal_development_plan_id } }
    end

    assert_redirected_to growth_area_url(GrowthArea.last)
  end

  test "should show growth_area" do
    get growth_area_url(@growth_area)
    assert_response :success
  end

  test "should get edit" do
    get edit_growth_area_url(@growth_area)
    assert_response :success
  end

  test "should update growth_area" do
    patch growth_area_url(@growth_area), params: { growth_area: { description: @growth_area.description, name: @growth_area.name, personal_development_plan_id: @growth_area.personal_development_plan_id } }
    assert_redirected_to growth_area_url(@growth_area)
  end

  test "should destroy growth_area" do
    assert_difference("GrowthArea.count", -1) do
      delete growth_area_url(@growth_area)
    end

    assert_redirected_to growth_areas_url
  end
end
