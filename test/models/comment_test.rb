# frozen_string_literal: true

require "test_helper"
class CommentTest < ActiveSupport::TestCase
  test " contains commentable type of Report" do
    comment = reports(:report1).comments.create(content: "hello", user: users(:taro))
    assert_equal comment.commentable_type, "Report"
    assert_equal comment.commentable_id, reports(:report1).id
  end

  test "contains commentable type of Book" do
    comment = books(:book1).comments.create(content: "hello", user: users(:taro))
    assert_equal comment.commentable_type, "Book"
    assert_equal comment.commentable_id, books(:book1).id
  end
end
