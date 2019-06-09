module PlayersHelper
  def get_uuid(username)
    request = HTTParty.get("https://api.mojang.com/users/profiles/minecraft/" + username).to_json
    @parsed = JSON.parse(request)
    return @parsed["id"]
  end
end
