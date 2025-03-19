require "test_helper"

class PraisePostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @praise_post = praise_posts(:one)
  end

  test "should get index" do
    get praise_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_praise_post_url
    assert_response :success
  end

  test "should create praise_post" do
    assert_difference("PraisePost.count") do
      post praise_posts_url, params: { praise_post: { channel_id: @praise_post.channel_id, message: @praise_post.message, nominator_id: @praise_post.nominator_id, nominee_id: @praise_post.nominee_id, praise_type_id: @praise_post.praise_type_id } }
    end

    assert_redirected_to praise_post_url(PraisePost.last)
  end

  test "should show praise_post" do
    get praise_post_url(@praise_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_praise_post_url(@praise_post)
    assert_response :success
  end

  test "should update praise_post" do
    patch praise_post_url(@praise_post), params: { praise_post: { channel_id: @praise_post.channel_id, message: @praise_post.message, nominator_id: @praise_post.nominator_id, nominee_id: @praise_post.nominee_id, praise_type_id: @praise_post.praise_type_id } }
    assert_redirected_to praise_post_url(@praise_post)
  end

  test "should destroy praise_post" do
    assert_difference("PraisePost.count", -1) do
      delete praise_post_url(@praise_post)
    end

    assert_redirected_to praise_posts_url
  end
end
