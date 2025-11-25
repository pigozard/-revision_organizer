class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :bloc
  has_many :messages, dependent: :destroy

  validates :user_id, presence: true
  validates :bloc_id, presence: true
end
