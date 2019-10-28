class AuteurController < ApplicationController
  def content
    @gossip = Gossip.all
    @user = User.find(params[:id])
    @city = City.all
  end
end
