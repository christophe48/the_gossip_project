class HomeController < ApplicationController
  def index
    #je récupère mes tout mes gossip de mes models pour pouvoir les utiliser dans mes views
    @gossip = Gossip.all
    @user = User.all
  end
end
