class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_event, only: [:show, :destroy]

  # yizhu: add index controler to show all events
  def index
    @events = Event.all
    # authorize @Events             #Matt for pundit ?
    # @events = policy_scope(Event) #same
  end

  # Ilana
  def show
    set_event
  end

  private

  # ilana
  def set_event
    @event = Event.find(params[:id])
  end
end
