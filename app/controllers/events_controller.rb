class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  # yizhu: add index controler to show all events
  def index
    authorize @events
    # @events = Events.all
    @events = policy_scope(Event)
  end
end
