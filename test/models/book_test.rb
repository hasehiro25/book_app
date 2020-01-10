# frozen_string_literal: true

require "test_helper"

class BookTest < ActiveSupport::TestCase
  test "orders following_users books by latest" do
    books = Book.recent_following_books(users(:taro).following_users)
    assert books.first.created_at > books.last.created_at
  end

  test "orders followed_users books by latest" do
    books = Book.recent_follower_books(users(:taro).followed_users)
    assert books.first.created_at > books.last.created_at
  end
end
