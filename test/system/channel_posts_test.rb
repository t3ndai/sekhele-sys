require "application_system_test_case"

class ChannelPostsTest < ApplicationSystemTestCase
  setup do
    @channel_post = channel_posts(:one)
  end

  test "visiting the index" do
    visit channel_posts_url
    assert_selector "h1", text: "Channel posts"
  end

  test "should create channel post" do
    visit channel_posts_url
    click_on "New channel post"

    fill_in "Channel", with: @channel_post.channel_id
    fill_in "Creator", with: @channel_post.creator_id
    fill_in "Likes", with: @channel_post.likes
    click_on "Create Channel post"

    assert_text "Channel post was successfully created"
    click_on "Back"
  end

  test "should update Channel post" do
    visit channel_post_url(@channel_post)
    click_on "Edit this channel post", match: :first

    fill_in "Channel", with: @channel_post.channel_id
    fill_in "Creator", with: @channel_post.creator_id
    fill_in "Likes", with: @channel_post.likes
    click_on "Update Channel post"

    assert_text "Channel post was successfully updated"
    click_on "Back"
  end

  test "should destroy Channel post" do
    visit channel_post_url(@channel_post)
    click_on "Destroy this channel post", match: :first

    assert_text "Channel post was successfully destroyed"
  end
end
