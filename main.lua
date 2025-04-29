local UniverseID = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://apis.roblox.com/universes/v1/places/" ..game.PlaceId.. "/universe")).universeId

if game.PlaceId == 4483381587 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/oevkrio/RobloxMenuScripts/refs/heads/main/test.lua"))()
end
