class GossipController < ApplicationController
  def content
    @gossip = Gossip.all
    @user = User.all
  end
end
