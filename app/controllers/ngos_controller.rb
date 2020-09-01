class NgosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def like	
    set_ngo	
    @ngo.liked_by current_user	
    redirect_to root_path(anchor: "event-recos")	
  end	

  def unlike	
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
