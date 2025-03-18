require "test_helper"

class ChannelPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @channel_post = channel_posts(:one)
  end

  test "should get index" do
    get channel_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_channel_post_url
    assert_response :success
  end

  test "should create channel_post" do
    assert_difference("ChannelPost.count") do
      post channel_posts_url, params: { channel_post: { channel_id: @channel_post.channel_id, creator_id: @channel_post.creator_id, likes: @channel_post.likes } }
    end

    assert_redirected_to channel_post_url(ChannelPost.last)
  end

  test "should show channel_post" do
    get channel_post_url(@channel_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_channel_post_url(@channel_post)
    assert_response :success
  end

  test "should update channel_post" do
    patch channel_post_url(@channel_post), params: { channel_post: { channel_id: @channel_post.channel_id, creator_id: @channel_post.creator_id, likes: @channel_post.likes } }
    assert_redirected_to channel_post_url(@channel_post)
  end

  test "should destroy channel_post" do
    assert_difference("ChannelPost.count", -1) do
      delete channel_post_url(@channel_post)
    end

    assert_redirected_to channel_posts_url
  end
end
