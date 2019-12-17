# frozen_string_literal: true

require "test_helper"

class BookTest < ActiveSupport::TestCase
  test "recent_following_books should return following books by newest" do
    books = Book.recent_following_books(users(:taro).following_users)
    assert books.first.created_at > books.last.created_at
  end

  test "recent_follower_books should return follower books by newest" do
    books = Book.recent_follower_books(users(:taro).followed_users)
    assert books.first.created_at > books.last.created_at
  end
end
