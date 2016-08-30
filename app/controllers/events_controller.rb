class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = policy_scope(Event)
    authorize @events

    session[:city] = params[:search][:city]
    session[:capacity] = params[:search][:capacity]

    d = params[:search][:date].split('/')
    d = (d[1] + '/' + d[0] + '/' +d[2]).to_date
    session[:date] = d

    if params[:search].nil?
      @events = Event.where.not(latitude: nil, longitude: nil)
    else
      @search = params[:search]
      @events = Event.near(@search[:city],5)
                      .where("capacity >= ?", @search[:capacity].to_f)
                      .where("starting_at >= ?", session[:date])
                      .where("starting_at <= ?", session[:date] + 2)
    end

    @hash = Gmaps4rails.build_markers(@events) do |event, marker|
      marker.lat event.latitude
      marker.lng event.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end

  def show
    @reservation = Reservation.new
  end

  def new
    if current_user.first_name.blank? || current_user.birth_date.blank?
      session[:retake_create_event] = true
      redirect_to edit_user_registration_path, alert: "Please fill in the fields to create an event "
    end
    @event = Event.new
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    authorize @event
    if @event.save
      redirect_to dashboard_path, notice: "You have successfully created an event."
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

  def destroy
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
      :canceled_at,
      photos: [] )
  end
end



