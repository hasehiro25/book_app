# frozen_string_literal: true

require "application_system_test_case"

class SignInTest < ApplicationSystemTestCase
  test "redirects to root_path when logged out" do
    visit root_path
    assert_text "ログインしてください"
  end

  test "signs in with valid email and password" do
    visit new_user_session_url

    fill_in "user[email]", with: "taro@sample.com"
    fill_in "user[password]", with: "foobarbiz"
    click_on "ログイン"
    assert_text "ログインしました"
  end

  test "unable to sign in with wrong password" do
    visit new_user_session_url

    fill_in "user[email]", with: "taro@sample.com"
    fill_in "user[password]", with: "wrongpassword"
    click_on "ログイン"
    assert_text "Eメールまたはパスワードが違います。"
  end

  test "signs in with github account" do
    OmniAuth.config.add_mock(:github, { uid: "123456", info: { email: "sample4@sample.com", nickname: "git-sample" } })
    visit new_user_session_url
    click_on "GitHubでログイン"
    sleep(1)
    assert_text "Github アカウントによる認証に成功しました"
  end
end
