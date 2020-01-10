
# frozen_string_literal: true

require "application_system_test_case"

class BookCommentsTest < ApplicationSystemTestCase
  def create_comment
    fill_in "comment[content]", with: "this is a comment"
    click_on "登録する"
    sleep(1)
  end

  setup do
    @user = users(:taro)
    sign_in(@user)
  end

  test "shows comments" do
    visit root_path
    click_on "詳細", match: :first
    sleep(1)
    assert_text "コメント"
  end

  test "creates comment" do
    visit root_path
    click_on "詳細", match: :first
    sleep(1)
    fill_in "comment[content]", with: "this is a comment"
    assert_difference "Comment.count", 1 do
      click_on "登録する"
    end
    assert_text "this is a comment"
  end

  test "fails to create comment" do
    visit root_path
    click_on "詳細", match: :first
    sleep(1)
    click_on "登録する"
    sleep(1)
    assert_text "コメント投稿に失敗しました"
  end

  test "updates comment" do
    visit root_path
    click_on "詳細", match: :first
    sleep(1)
    create_comment
    within ".card" do
      click_on "編集"
    end
    sleep(1)
    fill_in "comment[content]", with: "this is a edited comment"
    click_on "更新する"
    assert_text "this is a edited comment"
  end

  test "fails to update comment" do
    visit root_path
    click_on "詳細", match: :first
    find "h2", text: "コメントをする"
    create_comment
    within ".card" do
      click_on "編集"
      sleep(1)
    end
    fill_in "comment[content]", with: ""
    click_on "更新する"
    assert_text "コメント編集に失敗しました"
  end

  test "destrtoys comment" do
    visit root_path
    click_on "詳細", match: :first
    find "h2", text: "コメントをする"
    create_comment
    assert_difference "Comment.count", -1 do
      within ".card" do
        click_on "削除"
        page.driver.browser.switch_to.alert.accept
        sleep(1)
      end
    end
    assert_text "コメントを削除しました"
  end
end
