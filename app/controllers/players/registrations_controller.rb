include PlayersHelper
class Players::RegistrationsController < DeviseInvitable::RegistrationsController
    def update
      params["player"]["mcuuid"] = get_uuid(params["player"]["mcuuid"])
      super
    end
end