class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname          , presence: true
  validates :lastname          , presence: true
  validates :firstname         , presence: true
  validates :lastname_furigana , presence: true
  validates :firstname_furigana, presence: true
  validates :birthday          , presence: true

  has_many :items
  has_many :orders
end
