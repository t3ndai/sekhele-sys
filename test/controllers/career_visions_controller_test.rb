require "test_helper"

class CareerVisionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @career_vision = career_visions(:one)
  end

  test "should get index" do
    get career_visions_url
    assert_response :success
  end

  test "should get new" do
    get new_career_vision_url
    assert_response :success
  end

  test "should create career_vision" do
    assert_difference("CareerVision.count") do
      post career_visions_url, params: { career_vision: { description: @career_vision.description, name: @career_vision.name, personal_development_plan_id: @career_vision.personal_development_plan_id } }
    end

    assert_redirected_to career_vision_url(CareerVision.last)
  end

  test "should show career_vision" do
    get career_vision_url(@career_vision)
    assert_response :success
  end

  test "should get edit" do
    get edit_career_vision_url(@career_vision)
    assert_response :success
  end

  test "should update career_vision" do
    patch career_vision_url(@career_vision), params: { career_vision: { description: @career_vision.description, name: @career_vision.name, personal_development_plan_id: @career_vision.personal_development_plan_id } }
    assert_redirected_to career_vision_url(@career_vision)
  end

  test "should destroy career_vision" do
    assert_difference("CareerVision.count", -1) do
      delete career_vision_url(@career_vision)
    end

    assert_redirected_to career_visions_url
  end
end
