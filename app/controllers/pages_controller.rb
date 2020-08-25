class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @events = Event.all.last(3)
  end

  def dashboard
    current_user
    # @my_events = current_user.events
  end
end
