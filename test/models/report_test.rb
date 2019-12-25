# frozen_string_literal: true

require "test_helper"

class ReportTest < ActiveSupport::TestCase
  test "orders reports by latest" do
    reports = Report.all.recent_reports
    assert reports.first.created_at > reports.last.created_at
  end
end
