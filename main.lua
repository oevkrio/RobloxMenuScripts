repeat wait() until game:IsLoaded() and game.Players.LocalPlayer

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local UniverseID = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://apis.roblox.com/universes/v1/places/" ..game.PlaceId.. "/universe")).universeId

if game.PlaceId == 4483381587 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/oevkrio/RobloxMenuScripts/refs/heads/main/test.lua"))()
else:
    LocalPlayer:Kick("This game is currently not supported.")
end
