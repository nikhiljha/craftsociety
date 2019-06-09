class PlayersController < ApplicationController
  def new
  end

  def canplay
    @player = Player.find_by(mcuuid: params[:uuid])
    @allowed = false
    if @player.nil?
      # Do nothing.
    elsif @player.enabled.nil? || @player.enabled
      @allowed = true
    end
    render json: { whitelisted: @allowed }
  end
end
