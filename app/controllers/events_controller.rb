class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_event, only: [:show, :destroy]

  # yizhu: add index controler to show all events
  def index
    # Matt for pundit ?
    @events = policy_scope(Event).geocoded.order(created_at: :desc)

    # Kally
    @participations = Participation.all
    seats_left # private method below to count seats_left

    @markers = @events.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { event: event })
      }
    end
  end

  # Ilana
  def show
    @participation = Participation.new
  end

  private

  # ilana
  def set_event
    @event = Event.find(params[:id])
    authorize @event
  end

  # Kally
  def seats_left
    @events.each do |event|
      if Participation.where(event_id: event.id)
        event_participations = Participation.where(event_id: event.id)
        event.seats_left = event.seats - event_participations.size
      else
        event.seats_left = event.seats
      end
      event.save
    end
  end
end
