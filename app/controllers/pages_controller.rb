class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  skip_after_action :verify_authorized, only: [ :home, :dashboard ]
  after_action :verify_policy_scoped, only: :dashboard

  def home
    @events = Event.all
  end

  def dashboard
    @events = policy_scope(Event).where(user_id: current_user.id)
    @reservations = policy_scope(Reservation).where(user: current_user)
    # @messages = policy_scope(Message).where(user: :sender_id || :recipient_id)
    @messages = policy_scope(Message).where(sender_id: current_user).or(policy_scope(Message)
                                      .where(recipient_id: current_user))
  end
end
