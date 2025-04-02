require "test_helper"

class AgendaItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get agenda_items_index_url
    assert_response :success
  end

  test "should get create" do
    get agenda_items_create_url
    assert_response :success
  end

  test "should get update" do
    get agenda_items_update_url
    assert_response :success
  end
end
