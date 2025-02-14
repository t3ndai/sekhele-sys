require "application_system_test_case"

class LeavePoliciesTest < ApplicationSystemTestCase
  setup do
    @leave_policy = leave_policies(:one)
  end

  test "visiting the index" do
    visit leave_policies_url
    assert_selector "h1", text: "Leave policies"
  end

  test "should create leave policy" do
    visit leave_policies_url
    click_on "New leave policy"

    fill_in "Balance expires", with: @leave_policy.balance_expires
    fill_in "Balance starts", with: @leave_policy.balance_starts
    fill_in "Leave category", with: @leave_policy.leave_category_id
    fill_in "Name", with: @leave_policy.name
    fill_in "Organization", with: @leave_policy.organization_id
    fill_in "Start balance", with: @leave_policy.start_balance
    click_on "Create Leave policy"

    assert_text "Leave policy was successfully created"
    click_on "Back"
  end

  test "should update Leave policy" do
    visit leave_policy_url(@leave_policy)
    click_on "Edit this leave policy", match: :first

    fill_in "Balance expires", with: @leave_policy.balance_expires
    fill_in "Balance starts", with: @leave_policy.balance_starts
    fill_in "Leave category", with: @leave_policy.leave_category_id
    fill_in "Name", with: @leave_policy.name
    fill_in "Organization", with: @leave_policy.organization_id
    fill_in "Start balance", with: @leave_policy.start_balance
    click_on "Update Leave policy"

    assert_text "Leave policy was successfully updated"
    click_on "Back"
  end

  test "should destroy Leave policy" do
    visit leave_policy_url(@leave_policy)
    click_on "Destroy this leave policy", match: :first

    assert_text "Leave policy was successfully destroyed"
  end
end
