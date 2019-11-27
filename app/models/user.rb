class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_POSTCODE = /\A\z|\A\d{7}\z/
  validates :postcode, format: { with: VALID_POSTCODE }
end
