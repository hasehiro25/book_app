# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable

  has_one_attached :avatar

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

  def thumbnail
    avatar.variant(resize: "300x300")
  end

  def delete_avatar
    avatar.purge
  end
end
