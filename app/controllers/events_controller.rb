class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new]
  before_action :find_event, only: [:show, :create, :edit, :update]

  def index
    @events = policy_scope(Event)
  end

  def show
  end

  def new
    @event = Event.new(event_params)
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @event.update(event_params)
    redirect_to dashboard_path
  end

  private

  def find_event
    @event = Event.find(params[:id])
    authorize @event
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



