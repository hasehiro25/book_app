# frozen_string_literal: true

require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:taro)
    sign_in(@user)
  end

  test "shows users list" do
    visit users_url
    assert_selector "h1", text: "ユーザー一覧"
  end

  test "shows user page" do
    visit user_url(@user)
    assert_selector "h1", text: "#{@user.name}さん"
  end

  test "creates new user" do
    sign_out(@user)
    visit new_user_registration_url
    fill_in "user[name]", with: "John"
    fill_in "user[email]", with: "sample-john@example.com"
    fill_in "user[password]", with: "hogehoge"
    fill_in "user[password_confirmation]", with: "hogehoge"
    assert_difference "User.count", 1 do
      click_on "アカウント登録"
    end
    assert_text "アカウント登録が完了しました。"
  end

  test "updates user" do
    visit root_url
    click_on "edit"
    sleep(1)
    fill_in "user[name]", with: "John"
    fill_in "user[email]", with: "sample-john@example.com"
    fill_in "user[postcode]", with: "1231234"
    fill_in "user[address]", with: "tokyo"
    fill_in "user[profile]", with: "こんにちは\nジョンです"
    click_on "更新"
    assert_text "アカウント情報を変更しました。"
    assert_text "John"
    assert_text "sample-john@example.com"
    assert_text "1231234"
    assert_text "tokyo"
    assert_text "こんにちは\nジョンです"
  end

  test "deletes user" do
    visit root_url
    click_on "edit"
    sleep(1)
    assert_difference "User.count", -1 do
      click_on "アカウント削除"
      page.driver.browser.switch_to.alert.accept
      sleep(1)
    end
  end
end
