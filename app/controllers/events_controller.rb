class EventsController < ApplicationController
  respond_to :html
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
    @participation = Participation.new
  end

  def like
    set_event
    @event.liked_by current_user
    redirect_to events_path
  end

  def unlike
    set_event
    @event.unliked_by current_user
    redirect_to events_path
  end

  private

  # ilana
  def set_event
    @event = Event.find(params[:id])
    authorize @event
  end
end
