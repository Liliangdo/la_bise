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

  has_attachments :photos, maximum: 5
  geocoded_by :address
  after_validation :geocode, if: :address_changed?



  def available_places
    self.capacity - self.reservations.count
  end

  def available?
    available_places >= 1
  end

end

