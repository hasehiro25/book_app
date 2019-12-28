# frozen_string_literal: true

require "application_system_test_case"

class BooksTest < ApplicationSystemTestCase
  setup do
    @user = users(:taro)
    sign_in(@user)
  end

  test "shows following" do
    visit root_url
    click_on "following"
    assert_selector "h2", text: "フォロー (#{@user.following_users.count})"
  end

  test "shows follower" do
    visit root_url
    click_on "follower"
    assert_selector "h2", text: "フォロワー (#{@user.followed_users.count})"
  end

  test "follows user" do
    visit user_path(users(:shiro))
    assert_difference "Following.count", 1 do
      click_on "フォローする"
    end
    assert_text "フォローしました"
  end

  test "unfollows user" do
    visit user_path(users(:jiro))
    assert_difference "Following.count", -1 do
      click_on "フォローを外す"
    end
    assert_text "フォローを解除しました"
  end
end
