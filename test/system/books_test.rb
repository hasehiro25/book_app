# frozen_string_literal: true

require "application_system_test_case"

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:book1)
    @user = users(:taro)
    sign_in(@user)
  end

  test "shows books list" do
    visit books_url
    assert_selector "h1", text: "Books"
  end

  test "creates book" do
    visit books_url
    click_on "新しい本を登録"

    fill_in "book[memo]", with: @book.memo
    fill_in "book[title]", with: @book.title
    assert_difference "Book.count", 1 do
      click_on "登録する"
    end
    assert_text "新しく本を登録しました"
    click_on "戻る"
  end

  test "updates book" do
    visit books_url
    click_on "編集", match: :first

    fill_in "book[memo]", with: @book.memo
    fill_in "book[title]", with: @book.title
    click_on "更新する"

    assert_text "本を更新しました"
    click_on "戻る"
  end

  test "destroys book" do
    visit books_url
    assert_difference "Book.count", -1 do
      click_on "削除", match: :first
      page.driver.browser.switch_to.alert.accept
      find ".alert.alert-info", text: "本を削除しました"
    end
    assert_text "本を削除しました"
  end
end
