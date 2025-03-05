require "test_helper"

class OneToOnesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @one_to_one = one_to_ones(:one)
  end

  test "should get index" do
    get one_to_ones_url
    assert_response :success
  end

  test "should get new" do
    get new_one_to_one_url
    assert_response :success
  end

  test "should create one_to_one" do
    assert_difference("OneToOne.count") do
      post one_to_ones_url, params: { one_to_one: { employee_id: @one_to_one.employee_id, manager_id: @one_to_one.manager_id, note: @one_to_one.note } }
    end

    assert_redirected_to one_to_one_url(OneToOne.last)
  end

  test "should show one_to_one" do
    get one_to_one_url(@one_to_one)
    assert_response :success
  end

  test "should get edit" do
    get edit_one_to_one_url(@one_to_one)
    assert_response :success
  end

  test "should update one_to_one" do
    patch one_to_one_url(@one_to_one), params: { one_to_one: { employee_id: @one_to_one.employee_id, manager_id: @one_to_one.manager_id, note: @one_to_one.note } }
    assert_redirected_to one_to_one_url(@one_to_one)
  end

  test "should destroy one_to_one" do
    assert_difference("OneToOne.count", -1) do
      delete one_to_one_url(@one_to_one)
    end

    assert_redirected_to one_to_ones_url
  end
end
