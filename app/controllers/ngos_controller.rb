class NgosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    set_ngo
    @ngo_events = @ngo.events
    @upcoming_ngo_events = []
    @past_ngo_events = []
    @ngo_events.each do |event|
      if event.end_date > DateTime.now
        @upcoming_ngo_events << event
      else
        @past_ngo_events << event
      end
    end
    @upcoming_ngo_events
    @past_ngo_events
  end

  def follow
    set_ngo
    @ngo.liked_by current_user
    redirect_to root_path(anchor: "event-recos")
  end

  def unfollow
    set_ngo
    @ngo.unliked_by current_user
    redirect_to root_path(anchor: "event-recos")
  end

  private

  # ilana
  def set_ngo
    @ngo = Ngo.find(params[:id])
    authorize @ngo
  end
end
