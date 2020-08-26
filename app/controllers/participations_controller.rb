class ParticipationsController < ApplicationController
  def create
    @user = current_user
    @event = Event.find(params[:id])
    @participation = Participation.new(user_id: @user.id, event_id: @event.id)
  end
end
