class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  has_many :reservations
  has_many :events, through: :reservations
  has_many :messages_sent, class_name: "Message", foreign_key: :sender_id
  has_many :messages_received, class_name: "Message", foreign_key: :recipient_id
  has_many :reviews, through: :events


  validates :first_name, presence: true, on: :update
  validates :birth_date, presence: true, on: :update

  # validates :last_name, presence: true
  # validates :address, presence: true
  # validates :gender, presence: true
  # validates :phone_number, presence: true
  # validates :email, uniqueness: true

  # has_attachment :photo

  def self.find_for_facebook_oauth(auth)
    user_params = auth.to_h.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)

    user = User.where(provider: auth.provider, uid: auth.uid).first
    user ||= User.where(email: auth.info.email).first # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end


  def username
    "#{self.first_name} #{self.last_name[0]}"
  end

  def age_calculator
    ((Date.today - self.birth_date.to_date).to_i / 365.25).to_i
  end

end
