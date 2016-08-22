class Event < ApplicationRecord
  belongs_to :user
  has_many :messages
  has_many :reservations
  has_many :reviews

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :house_type, presence: true
  validates :capacity, presence: true
  validates :starting_at, presence: true

end

