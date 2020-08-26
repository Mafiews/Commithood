class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_event, only: [:show, :destroy]

  # yizhu: add index controler to show all events
  def index
    #Matt for pundit ?
    @events = policy_scope(Event).order(created_at: :desc)
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
