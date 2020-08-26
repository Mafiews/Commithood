class ParticipationsController < ApplicationController
  def create
    @user = current_user
    @event = Event.find(params[:event_id])
    @participation = Participation.new(user_id: @user.id, event_id: @event.id)
    authorize @participation
    if @participation.save
      redirect_to event_path(@event)
    else
      render "events/show"
    end
  end
end
