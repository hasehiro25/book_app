# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable

  has_one_attached :avatar
  has_many :books, dependent: :destroy
  has_many :followings, class_name: "Following",
                        foreign_key: "follower_id",
                        dependent: :destroy
  has_many :following_users, through: :followings, source: :followed
  has_many :followers, class_name: "Following",
                       foreign_key: "followed_id",
                       dependent: :destroy
  has_many :followed_users, through: :followers, source: :follower
  has_many :reports, dependent: :destroy
  has_many :comments, dependent: :destroy

  VALID_POSTCODE = /\A\z|\A\d{7}\z/
  validates :name, presence: true, uniqueness: true
  validates :postcode, format: { with: VALID_POSTCODE }

  attr_accessor :delete_avatar_check
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.name = auth.info.nickname
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def delete_avatar
    avatar.purge
  end

  def following?(user)
    followings.exists?(followed_id: user.id)
  end
end
