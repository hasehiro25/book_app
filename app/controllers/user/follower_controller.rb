# frozen_string_literal: true

class User::FollowerController < ApplicationController
  def show
    @user =  User.find(params[:user_id])
    @followers = @user.followed_users
    @books = Book.recent_follower_books(@followers)
  end
end
