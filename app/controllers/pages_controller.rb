class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  skip_after_action :verify_authorized, only: [ :home, :dashboard ]
  after_action :verify_policy_scoped, only: :dashboard

  def home
    @events = Event.all
  end

  def dashboard
    @events = policy_scope(Event).where(user_id: current_user.id)
    # have informations about my reservation
    @reservations = policy_scope(Reservation).where(user: current_user)
    @user = current_user
  end
end
