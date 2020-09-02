class ParticipationsController < ApplicationController
  def create
    @user = current_user
    @event = Event.find(params[:event_id])
    @participation = Participation.new(user_id: @user.id, event_id: @event.id) if @event.seats_left.positive?
    authorize @participation
    if @participation.save
      @event.seats_left = @event.seats - 1
      @event.save
    #   redirect_to event_path(@event)
    # else
    #   render "events/show"
    end
  end
end
