class EventsController < ApplicationController

  before_action :find_event, only: [:show, :create, :edit, :update]

  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new(event_params)
  end

  def create

  end

  def edit
  end

  def update
  end

  private

  def find_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:events).permit( 
      :name,
      :description,
      :price,
      :house_type,
      :capacity,
      :starting_at, 
      photos: [] )
  end
end



