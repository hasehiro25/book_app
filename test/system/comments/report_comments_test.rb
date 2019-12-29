# frozen_string_literal: true

require "application_system_test_case"

class ReportCommentsTest < ApplicationSystemTestCase
  setup do
    @user = users(:taro)
    sign_in(@user)
  end

  test "shows comments" do
    visit root_path
    click_on "reports"
    click_on reports(:report1).title

    assert_text "コメント"
  end

  test "creates comment" do
    visit root_path
    click_on "reports"
    click_on reports(:report1).title
    fill_in "comment[content]", with: "this is a comment"
    assert_difference "Comment.count", 1 do
      click_on "登録する"
    end

    assert_text "this is a comment"
  end

  test "fails to create comment" do
    visit root_path
    click_on "reports"
    click_on reports(:report1).title
    click_on "登録する"

    assert_text "コメント投稿に失敗しました"
  end

  test "updates comment" do
    visit root_path
    click_on "reports"
    click_on reports(:report1).title
    within ".card" do
      click_on "編集"
      sleep(0.5)
    end
    fill_in "comment[content]", with: "this is a edited comment"
    click_on "更新する"
    assert_text "this is a edited comment"
  end

  test "fails to update comment" do
    visit root_path
    click_on "reports"
    click_on reports(:report1).title
    within ".card" do
      click_on "編集"
      sleep(0.5)
    end
    fill_in "comment[content]", with: ""
    click_on "更新する"
    assert_text "コメント編集に失敗しました"
  end

  test "destrtoys comment" do
    visit root_path
    click_on "reports"
    click_on reports(:report1).title
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
