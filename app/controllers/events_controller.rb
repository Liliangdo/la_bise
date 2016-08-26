class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_event, only: [:show, :edit, :update]

  def index
    @events = policy_scope(Event)
    authorize @events

    session[:city] = params[:search][:city]
    session[:capacity] = params[:search][:capacity]
    session[:date] = params[:search][:date]

    if params[:search].nil?
      @events = Event.where.not(latitude: nil, longitude: nil)
    else
      @search = params[:search]
      @events = Event.near(@search[:city],5).where("capacity >= ?", @search[:capacity].to_f)
    end

    @hash = Gmaps4rails.build_markers(@events) do |event, marker|
      marker.lat event.latitude
      marker.lng event.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end

  def show
  end

  def new
    if current_user.first_name.blank? || current_user.birth_date.blank?
      session[:retake_create_event] = true
      redirect_to edit_user_registration_path, alert: "Please fill in the fields  to create an event "
    end
    @event = Event.new
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    authorize @event
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
    params.require(:event).permit(
      :name,
      :description,
      :price,
      :house_type,
      :capacity,
      :starting_at,
      :address,
      :mood,
      :option,
      photos: [] )
  end
end



