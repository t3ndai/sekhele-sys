require "application_system_test_case"

class OneToOnesTest < ApplicationSystemTestCase
  setup do
    @one_to_one = one_to_ones(:one)
  end

  test "visiting the index" do
    visit one_to_ones_url
    assert_selector "h1", text: "One to ones"
  end

  test "should create one to one" do
    visit one_to_ones_url
    click_on "New one to one"

    fill_in "Employee", with: @one_to_one.employee_id
    fill_in "Manager", with: @one_to_one.manager_id
    fill_in "Note", with: @one_to_one.note
    click_on "Create One to one"

    assert_text "One to one was successfully created"
    click_on "Back"
  end

  test "should update One to one" do
    visit one_to_one_url(@one_to_one)
    click_on "Edit this one to one", match: :first

    fill_in "Employee", with: @one_to_one.employee_id
    fill_in "Manager", with: @one_to_one.manager_id
    fill_in "Note", with: @one_to_one.note
    click_on "Update One to one"

    assert_text "One to one was successfully updated"
    click_on "Back"
  end

  test "should destroy One to one" do
    visit one_to_one_url(@one_to_one)
    click_on "Destroy this one to one", match: :first

    assert_text "One to one was successfully destroyed"
  end
end
