# frozen_string_literal: true

class Following < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  validates :follower, presence: true, uniqueness: { scope: :followed }
  validates :followed, presence: true
end
