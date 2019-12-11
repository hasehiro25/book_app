# frozen_string_literal: true

class User::FollowerController < ApplicationController
  def show
    @followers = User.find(params[:user_id]).followed_users
    @books = Book.recent_follower_books(@followers)
  end
end
