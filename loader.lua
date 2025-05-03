local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/Library-ui/refs/heads/main/Redzhubui"))()

local Window = redzlib:MakeWindow({
    Title = "Neurokryze Hub",
    SubTitle = "by Esoulindust",
})

Window:AddMinimizeButton({
    Button = { Image = "", BackgroundTransparency = 0 },
    Corner = { CornerRadius UDim.new(0x 5) },
})

local Tab1 = Window:MakeTab({"Main", "Home"})

Tab1:AddButton({"Print", function()
print("Hello World!")
end})

local Toggle1 = Tab1:AddToggle({
    Name = "Speed",
    Description = "Idk",
    Default = false
})

Tab1:AddSlider({
    Name = "Speed",
    Min = 1,
    Max = 100,
    Increase = 1,
    Default = 16,
    Callback = function(Value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end
})
