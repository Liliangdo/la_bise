class ReservationsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:new]
  before_action :find_reservation, only: [ :create, :update, :destroy]

  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new
    if @reservation.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def update
    @reservation.update
    redirect_to dashboard_path
  end

  def destroy
    @reservation.destroy
    redirect_to dashboard_path
  end

  private

  def find_reservation
    @reservation = Reservation.find(params[:id])
  end
end
