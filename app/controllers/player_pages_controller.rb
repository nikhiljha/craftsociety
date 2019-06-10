class PlayerPagesController < ApplicationController
  before_action :authenticate_player!
end
