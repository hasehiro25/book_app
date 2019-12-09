# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :user

  mount_uploader :picture, PictureUploader

  def same_user?(user)
    self.user == user
  end
end
