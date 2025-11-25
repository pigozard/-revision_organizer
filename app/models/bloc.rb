class Bloc < ApplicationRecord
  has_many :chats, dependent: :destroy
  has_many :users, through: :chats

  validates :name, presence: true
  validates :content, presence: true
  validates :bloc_prompt, presence: true
end
