class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :guest, presence: true, numericality: true

  def confirmed?
    !self.accepted_at.nil?
  end

end
