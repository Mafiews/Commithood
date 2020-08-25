class EventsController < ApplicationController

  # yizhu: add index controler to show all events
  def index
    @events = Events.all
    # authorize @events
     # @events = policy_scope(Event)
  end


end
