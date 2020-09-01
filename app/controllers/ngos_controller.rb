class NgosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    set_ngo
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
