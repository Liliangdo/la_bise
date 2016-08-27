class ReservationsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:new]
  before_action :find_reservation, only: [ :create, :update, :destroy]
  before_action :find_event, only: [ :new, :create, :update, :available_places]

  def index
    @reservations = policy_scope(Reservation)
  end

  def new
    @reservation = Reservation.new
    authorize @reservation
  end

  def create
    @reservation = Reservation.new(params_reservation)
    authorize @reservation
    @reservation.user = @current_user
    @reservation.event = @event
    if @reservation.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    @reservation.update(params_reservation)
    authorize @reservation
    redirect_to dashboard_path
  end

  def destroy

  end

  private

  def find_reservation
    @reservation = Reservation.find(params[:id])
  end

  def find_event
    @event = Event.find(params[:event_id])
  end

  def params_reservation
    params.require(:reservation).permit(:user_id, :event_id, :canceled_at, :accepted_at, :refused_at, :guest )
  end
end
