# frozen_string_literal: true

require "application_system_test_case"

class BooksTest < ApplicationSystemTestCase
  setup do
    @user = users(:taro)
    sign_in(@user)
  end

  test "shows list of reports" do
    visit reports_url
    assert_selector "h1", text: "Reports"
  end

  test "shows a report" do
    visit report_url(reports(:report1))
    assert_selector "h1", text: "title one"
  end

  test "creates a report" do
    visit reports_url
    click_on "新しいレポートを作成"

    fill_in "report[title]", with: "Test report"
    fill_in "report[body]", with: "This is a report of todays work"
    assert_difference "Report.count", 1 do
      click_on "登録する"
    end
    assert_text "レポートを作成しました"
  end

  test "does not create a report with no content" do
    visit reports_url
    click_on "新しいレポートを作成"
    click_on "登録する"
    assert_selector "h1", text: "New Report"
  end

  test "updates a report" do
    visit reports_url
    click_on "編集", match: :first

    fill_in "report[title]", with: "Test report edited"
    fill_in "report[body]", with: "This is a report of todays work edited"

    click_on "更新する"
    assert_text "レポートを更新しました"
  end

  test "does not update a report with no content" do
    visit reports_url
    click_on "編集", match: :first

    fill_in "report[title]", with: ""
    fill_in "report[body]", with: ""

    click_on "更新する"
    assert_selector "h1", text: "Edit Report"
  end

  test "deletes a report" do
    visit reports_url

    assert_difference "Report.count", -1 do
      click_on "削除", match: :first
      page.driver.browser.switch_to.alert.accept
      sleep(0.5)
    end
  end
end
