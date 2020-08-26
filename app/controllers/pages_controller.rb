class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @events = Event.all.last(3)
  end

  def dashboard
    @my_events = current_user.events
    # Kally : set variables to filter @my_events
    @my_upcoming_events = []
    @my_past_events = []
    @my_events.each do |my_event|
      if my_event.end_date < Date.today
        @my_past_events << my_event
      else
        @my_upcoming_events << my_event
      end
    end
    @my_upcoming_events
    @my_past_events
  end
end
