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


  def confirmed_users
    self.reservations.map { |r| r.user if r.confirmed? }
  end

  def average_reviews
    return "no review rating" if self.reviews.count == 0
    sum = 0
    self.reviews.each do |review|
     sum += review.rating
    end
    (sum / self.reviews.count).round
  end

end

