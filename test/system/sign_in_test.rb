# frozen_string_literal: true

require "application_system_test_case" 

class SignInTest < ApplicationSystemTestCase
  test "redirect to root path when not signed in" do
    visit root_path
    assert_text "ログインしてください"
  end

  test "login user with valid info " do
    visit new_user_session_url

    fill_in "user[email]", with: "taro@sample.com"
    fill_in "user[password]", with: "foobarbiz"
    click_on "ログイン"
    assert_text "ログインしました"
  end

  test "refuse login with invalid info " do
    visit new_user_session_url

    fill_in "user[email]", with: "taro@sample.com"
    fill_in "user[password]", with: "wrongpassword"
    click_on "ログイン"
    assert_text "Eメールまたはパスワードが違います。"
  end

  test "sign in with github" do
    OmniAuth.config.add_mock(:github, { uid: "123456", info: { email: "sample4@sample.com", nickname: "git-sample" } })
    visit new_user_session_url
    click_on "GitHubでログイン"

    assert_text "Github アカウントによる認証に成功しました"
  end
end
