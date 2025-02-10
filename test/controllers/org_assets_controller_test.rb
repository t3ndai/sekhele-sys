require "test_helper"

class OrgAssetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @org_asset = org_assets(:one)
  end

  test "should get index" do
    get org_assets_url
    assert_response :success
  end

  test "should get new" do
    get new_org_asset_url
    assert_response :success
  end

  test "should create org_asset" do
    assert_difference("OrgAsset.count") do
      post org_assets_url, params: { org_asset: { asset_category_id: @org_asset.asset_category_id, asset_name: @org_asset.asset_name, asset_serial_number: @org_asset.asset_serial_number, date_given: @org_asset.date_given, date_returned: @org_asset.date_returned, employee_id: @org_asset.employee_id } }
    end

    assert_redirected_to org_asset_url(OrgAsset.last)
  end

  test "should show org_asset" do
    get org_asset_url(@org_asset)
    assert_response :success
  end

  test "should get edit" do
    get edit_org_asset_url(@org_asset)
    assert_response :success
  end

  test "should update org_asset" do
    patch org_asset_url(@org_asset), params: { org_asset: { asset_category_id: @org_asset.asset_category_id, asset_name: @org_asset.asset_name, asset_serial_number: @org_asset.asset_serial_number, date_given: @org_asset.date_given, date_returned: @org_asset.date_returned, employee_id: @org_asset.employee_id } }
    assert_redirected_to org_asset_url(@org_asset)
  end

  test "should destroy org_asset" do
    assert_difference("OrgAsset.count", -1) do
      delete org_asset_url(@org_asset)
    end

    assert_redirected_to org_assets_url
  end
end
