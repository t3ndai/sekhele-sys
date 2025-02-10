require "application_system_test_case"

class OrgAssetsTest < ApplicationSystemTestCase
  setup do
    @org_asset = org_assets(:one)
  end

  test "visiting the index" do
    visit org_assets_url
    assert_selector "h1", text: "Org assets"
  end

  test "should create org asset" do
    visit org_assets_url
    click_on "New org asset"

    fill_in "Asset category", with: @org_asset.asset_category_id
    fill_in "Asset name", with: @org_asset.asset_name
    fill_in "Asset serial number", with: @org_asset.asset_serial_number
    fill_in "Date given", with: @org_asset.date_given
    fill_in "Date returned", with: @org_asset.date_returned
    fill_in "Employee", with: @org_asset.employee_id
    click_on "Create Org asset"

    assert_text "Org asset was successfully created"
    click_on "Back"
  end

  test "should update Org asset" do
    visit org_asset_url(@org_asset)
    click_on "Edit this org asset", match: :first

    fill_in "Asset category", with: @org_asset.asset_category_id
    fill_in "Asset name", with: @org_asset.asset_name
    fill_in "Asset serial number", with: @org_asset.asset_serial_number
    fill_in "Date given", with: @org_asset.date_given
    fill_in "Date returned", with: @org_asset.date_returned
    fill_in "Employee", with: @org_asset.employee_id
    click_on "Update Org asset"

    assert_text "Org asset was successfully updated"
    click_on "Back"
  end

  test "should destroy Org asset" do
    visit org_asset_url(@org_asset)
    click_on "Destroy this org asset", match: :first

    assert_text "Org asset was successfully destroyed"
  end
end
