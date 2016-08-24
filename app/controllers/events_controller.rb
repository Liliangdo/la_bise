class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new]
  before_action :find_event, only: [:show, :create, :edit, :update]

  def index
    @events = policy_scope(Event)
    authorize @events

    @events_map = Event.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@events_map) do |event, marker|
      marker.lat event.latitude
      marker.lng event.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end

  def show
  end

  def new
    @event = Event.new
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



