class Message < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :recipient, class_name: "User"
  belongs_to :event

  validates :content, presence: true, length: { minimum: 1 }
  validates :sender, presence: true
  validates :recipient, presence: true
  validates :event, presence: true
end
