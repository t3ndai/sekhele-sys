require "application_system_test_case"

class CareerVisionsTest < ApplicationSystemTestCase
  setup do
    @career_vision = career_visions(:one)
  end

  test "visiting the index" do
    visit career_visions_url
    assert_selector "h1", text: "Career visions"
  end

  test "should create career vision" do
    visit career_visions_url
    click_on "New career vision"

    fill_in "Description", with: @career_vision.description
    fill_in "Name", with: @career_vision.name
    fill_in "Personal development plan", with: @career_vision.personal_development_plan_id
    click_on "Create Career vision"

    assert_text "Career vision was successfully created"
    click_on "Back"
  end

  test "should update Career vision" do
    visit career_vision_url(@career_vision)
    click_on "Edit this career vision", match: :first

    fill_in "Description", with: @career_vision.description
    fill_in "Name", with: @career_vision.name
    fill_in "Personal development plan", with: @career_vision.personal_development_plan_id
    click_on "Update Career vision"

    assert_text "Career vision was successfully updated"
    click_on "Back"
  end

  test "should destroy Career vision" do
    visit career_vision_url(@career_vision)
    click_on "Destroy this career vision", match: :first

    assert_text "Career vision was successfully destroyed"
  end
end
