# frozen_string_literal: true

class Book < ApplicationRecord
  include Commentable

  belongs_to :user

  mount_uploader :picture, PictureUploader
  scope :recent_following_books, ->(followings) { includes(:user).where(users: { id: followings }).order(created_at: :desc) }
  scope :recent_follower_books, ->(follower) { includes(:user).where(users: { id: follower }).order(created_at: :desc) }

  def same_user?(user)
    self.user == user
  end
end
