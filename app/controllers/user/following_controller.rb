# frozen_string_literal: true

class User::FollowingController < ApplicationController
  def show
    @followings = User.find(params[:user_id]).followings.includes(followed: :books)
  end

  def create
    current_user.followings.create!(followed: User.find(params[:user_id]))
    redirect_to user_following_url(current_user), notice: "フォローしました"
  rescue ActiveRecord::RecordNotUnique
    redirect_to user_following_url(current_user), alert: "既にフォローしています"
  end

  def destroy
    current_user.followings.find_by(followed: User.find(params[:user_id])).destroy
    redirect_to user_following_url(current_user), notice: "フォローから外しました"
  end
end
