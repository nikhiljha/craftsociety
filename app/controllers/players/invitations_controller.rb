include PlayersHelper

class Players::InvitationsController < Devise::InvitationsController
  def update
    if !params["player"]["mcuuid"].nil? && params["player"]["mcuuid"].length == 32
      # Do nothing, we already have a UUID
    else
      params["player"]["mcuuid"] = get_uuid(params["player"]["mcuuid"])
    end
    super
  end
end