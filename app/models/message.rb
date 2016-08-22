class Message < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :content, presence: true, length: { minimum: 1 }
end
