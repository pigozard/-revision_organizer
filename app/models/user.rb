class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :chats, dependent: :destroy
  has_many :blocs, through: :chats

  validates :pseudo, presence: true
  validates :mail, presence: true, uniqueness: true
  validates :password, presence: true
end
