require "application_system_test_case"

class PraisePostsTest < ApplicationSystemTestCase
  setup do
    @praise_post = praise_posts(:one)
  end

  test "visiting the index" do
    visit praise_posts_url
    assert_selector "h1", text: "Praise posts"
  end

  test "should create praise post" do
    visit praise_posts_url
    click_on "New praise post"

    fill_in "Channel", with: @praise_post.channel_id
    fill_in "Message", with: @praise_post.message
    fill_in "Nominator", with: @praise_post.nominator_id
    fill_in "Nominee", with: @praise_post.nominee_id
    fill_in "Praise type", with: @praise_post.praise_type_id
    click_on "Create Praise post"

    assert_text "Praise post was successfully created"
    click_on "Back"
  end

  test "should update Praise post" do
    visit praise_post_url(@praise_post)
    click_on "Edit this praise post", match: :first

    fill_in "Channel", with: @praise_post.channel_id
    fill_in "Message", with: @praise_post.message
    fill_in "Nominator", with: @praise_post.nominator_id
    fill_in "Nominee", with: @praise_post.nominee_id
    fill_in "Praise type", with: @praise_post.praise_type_id
    click_on "Update Praise post"

    assert_text "Praise post was successfully updated"
    click_on "Back"
  end

  test "should destroy Praise post" do
    visit praise_post_url(@praise_post)
    click_on "Destroy this praise post", match: :first

    assert_text "Praise post was successfully destroyed"
  end
end
