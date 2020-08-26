class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_event, only: [:show, :destroy]

  # yizhu: add index controler to show all events
  def index
    #Matt for pundit ?
    @events = policy_scope(Event).geocoded.order(created_at: :desc)

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
    set_event
  end

  private

  # ilana
  def set_event
    @event = Event.find(params[:id])
    authorize @event
  end
end
