class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reservations
  has_many :events

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birth_date, presence: true
  validates :address, presence: true
  validates :gender, presence: true
  validates :phone_number, presence: true
  validates :email, uniqueness: true

end
