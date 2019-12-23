# frozen_string_literal: true

class User::FollowingController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @followings = @user.following_users
    @books = Book.recent_following_books(@followings)
  end

  def create
    @user = current_user.followings.build(followed: User.find(params[:user_id]))
    if @user.save
      redirect_to user_following_url(current_user), notice: t("following.create.success")
    else
      redirect_to user_following_url(current_user), alert: t("following.create.already_followed")
    end
  end

  def destroy
    current_user.followings.find_by(followed: User.find(params[:user_id])).destroy
    redirect_to user_following_url(current_user), notice: t("following.destroy.success")
  end
end
