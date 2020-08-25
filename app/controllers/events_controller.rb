class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  # yizhu: add index controler to show all events
  def index
    @events = Event.all
    # authorize @events
     # @events = policy_scope(Event)
  end


end
