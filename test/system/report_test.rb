# frozen_string_literal: true

require "application_system_test_case"

class BooksTest < ApplicationSystemTestCase
  setup do
    @user = users(:taro)
    sign_in(@user)
  end

  test "shows reports list" do
    visit reports_url
    assert_selector "h1", text: "Reports"
  end

  test "shows report" do
    visit report_url(reports(:report1))
    assert_selector "h1", text: "title one"
  end

  test "creates report" do
    visit reports_url
    click_on "新しいレポートを作成"

    fill_in "report[title]", with: "Test report"
    fill_in "report[body]", with: "This is a report of todays work"
    assert_difference "Report.count", 1 do
      click_on "登録する"
    end
    assert_text "レポートを作成しました"
  end

  test "unable to create report with blank content" do
    visit reports_url
    click_on "新しいレポートを作成"
    sleep(1)
    click_on "登録する"
    sleep(1)
    assert_selector "h1", text: "New Report"
  end

  test "updates report" do
    visit reports_url
    click_on "編集", match: :first

    fill_in "report[title]", with: "Test report edited"
    fill_in "report[body]", with: "This is a report of todays work edited"

    click_on "更新する"
    assert_text "レポートを更新しました"
  end

  test "unable to update report with blank content" do
    visit reports_url
    click_on "編集", match: :first
    sleep(1)

    fill_in "report[title]", with: ""
    fill_in "report[body]", with: ""

    click_on "更新する"
    assert_selector "h1", text: "Edit Report"
  end

  test "deletes report" do
    visit reports_url

    assert_difference "Report.count", -1 do
      click_on "削除", match: :first
      page.driver.browser.switch_to.alert.accept
      sleep(1)
    end
  end
end
