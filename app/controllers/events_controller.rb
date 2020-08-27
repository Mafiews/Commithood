class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_event, only: [:show, :destroy]

  # yizhu: add index controler to show all events
  def index
    #Matt for pundit ?
    @address = params[:address]
    @events = policy_scope(Event).includes(:causes)

    if params[:user_cause].present? && (params[:user_cause] != "Tous les thèmes") && (params[:address].present?)
      @causes = params[:user_cause]
      @events = filter_events_address_cause(@events, @causes, @address)

    elsif params[:user_cause].present? && (params[:user_cause] != "Tous les thèmes")
      @causes = params[:user_cause]
      @events = filter_events_cause(@events, @causes)

    elsif params[:address].present?
      @events = @events.near(@address, 5)

    else
      @events = policy_scope(Event).geocoded.order(created_at: :desc)
    end

    # Kally
    @participations = Participation.all
    seats_left # private method below to count seats_left
    # fr_datetime

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

  #Yizhu
  def filter_events_address_cause(events, causes, address)
    filter_events = []
      causes.each do |cause|
        events.near(@address, 5).select {|event| select_event << event.causes.include?(cause)}
      end
    filtered_events
  end

  def filter_events_cause(events, causes)
    filter_events = []
      causes.each do |cause|
        @events.where(causes: cause)
      end
    filtered_events
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
