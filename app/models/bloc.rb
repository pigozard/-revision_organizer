class Bloc < ApplicationRecord
  has_many :chats, dependent: :destroy
  has_many :users, through: :chats
  has_one :revision

  validates :name, presence: true
  validates :content, presence: true
  validates :bloc_prompt, presence: true
end

# chat.messages

# chat has many messages
