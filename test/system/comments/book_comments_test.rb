
# frozen_string_literal: true

require "application_system_test_case"

class BookCommentsTest < ApplicationSystemTestCase
  def create_comment
    fill_in "comment[content]", with: "this is a comment"
    click_on "登録する"
  end

  setup do
    @user = users(:taro)
    sign_in(@user)
  end

  test "show comments for books" do
    visit root_path
    click_on "詳細", match: :first
    assert_text "コメント"
  end

  test "create comment for books" do
    visit root_path
    click_on "詳細", match: :first
    fill_in "comment[content]", with: "this is a comment"
    assert_difference "Comment.count", 1 do
      click_on "登録する"
    end
    assert_text "this is a comment"
  end

  test "fail comment creatation for books" do
    visit root_path
    click_on "詳細", match: :first
    click_on "登録する"
    assert_text "コメント投稿に失敗しました"
  end

  test "update comment for books" do
    visit root_path
    click_on "詳細", match: :first
    create_comment
    within ".card" do
      click_on "編集"
      sleep(0.5)
    end
    fill_in "comment[content]", with: "this is a edited comment"
    click_on "更新する"
    assert_text "this is a edited comment"
  end

  test "fail comment update for books" do
    visit root_path
    click_on "詳細", match: :first
    create_comment
    within ".card" do
      click_on "編集"
      sleep(0.5)
    end
    fill_in "comment[content]", with: ""
    click_on "更新する"
    assert_text "コメント編集に失敗しました"
  end

  test "destrtoy comment for books" do
    visit root_path
    click_on "詳細", match: :first
    create_comment
    assert_difference "Comment.count", -1 do
      within ".card" do
        click_on "削除"
        page.driver.browser.switch_to.alert.accept
        sleep(0.5)
      end
    end
    assert_text "コメントを削除しました"
  end
end
