class PlayersController < ApplicationController
  def new
  end

  def canplay
    @cleanuuid = params[:uuid].tr("-", "")
    @player = Player.find_by(mcuuid: @cleanuuid)
    @allowed = false
    if @player.nil?
      # Do nothing.
    elsif @player.enabled.nil? || @player.enabled
      @allowed = true
    end
    render json: { whitelisted: @allowed }
  end
end
