class ReservationsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:new]
  before_action :find_reservation, only: [ :create, :update, :destroy]
  before_action :find_event, only: [ :new, :create, :available_places]

  def index
    @reservations = policy_scope(Reservation)
  end

  def new
    @reservation = Reservation.new
    authorize @reservation
  end

  def create

  end

  def update

  end

  def destroy

  end

  private

  def find_reservation
  #  @reservation = Reservation.find(params[:event_id])
  end

  def find_event
    @event = Event.find(params[:event_id])
  end
end
