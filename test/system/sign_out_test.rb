# frozen_string_literal: true

require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:taro)
    sign_in(@user) 
  end

  test "sign out" do
    visit root_path
    click_on "logout"
    assert_text "ログイン"
  end
end
