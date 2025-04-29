local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local response = game:HttpGet("https://apis.roblox.com/universes/v1/places/" .. game.PlaceId .. "/universe")
local UniverseID = HttpService:JSONDecode(response).universeId

if game.PlaceId == 4483381587 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/oevkrio/RobloxMenuScripts/refs/heads/main/test.lua"))()
else
    LocalPlayer:Kick("This game is currently not supported.")
end
