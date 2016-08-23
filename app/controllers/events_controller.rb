class EventsController < ApplicationController
  def index
  end

  def show
  end

  def new
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
    params.require(:events).permit( photos: [],
      :name,
      :description,
      :price,
      :house_type,
      :capacity,
      :starting_at )
  end
end



