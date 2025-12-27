local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
local Window = WindUI:CreateWindow({
    Title = "xiao xin",
    Icon = "crown",
    Author = "xiao xin",
    AuthorImage = 90840643379863,
    Folder = "CloudHub",
    Size = UDim2.fromOffset(560, 360),
    Transparent = true,
    User = {
        Enabled = true,
        Callback = function() 
            print("clicked") 
        end,
        Anonymous = false
    },
})

Window:EditOpenButton({
    Title = "xiao xin",
    Icon = "crown",
    CornerRadius = UDim.new(1, 0),
    StrokeThickness = 3,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(144, 238, 144)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 100, 0))
    }),
    Draggable = true
})


function Tab(a)
    return Window:Tab({Title = a, Icon = "eye"})
end

function Button(a, b, c)
    return a:Button({Title = b, Callback = c})
end

function Toggle(a, b, c, d)
    return a:Toggle({Title = b, Value = c, Callback = d})
end

function Slider(a, b, c, d, e, f)
    return a:Slider({Title = b, Step = 1, Value = {Min = c, Max = d, Default = e}, Callback = f})
end

function Dropdown(a, b, c, d, e)
    return a:Dropdown({Title = b, Values = c, Value = d, Callback = e})
end

function Input(a, b, c, d, e, f)
    return a:Input({
        Title = b,
        Desc = c or "",
        Value = d or "",
        Placeholder = e or "",
        Callback = f
    })
end

local tab1 = tab("本地通用")

local GeneralTab = Window:Tab({Title = "本地通用", Icon = "settings"})

GeneralTab:Slider({
    Title = "步行速度!",
    Step = 1,
    Value = {Min = 16, Max = 400, Default = 16},
    Callback = function(Speed)
        spawn(function() 
            while task.wait() do 
                if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Speed 
                end
            end 
        end)
    end
})

GeneralTab:Slider({
    Title = "跳跃高度!",
    Step = 1,
    Value = {Min = 50, Max = 400, Default = 50},
    Callback = function(Jump)
        spawn(function() 
            while task.wait() do 
                if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                    game.Players.LocalPlayer.Character.Humanoid.JumpPower = Jump 
                end
            end 
        end)
    end
})

GeneralTab:Input({
    Title = "重力设置!",
    Desc = "输入重力值",
    Value = "",
    Placeholder = "输入",
    Callback = function(Gravity)
        spawn(function() 
            while task.wait() do 
                local num = tonumber(Gravity)
                if num then
                    game.Workspace.Gravity = num 
                end
            end 
        end)
    end
})

GeneralTab:Toggle({
    Title = "夜视",
    Value = false,
    Callback = function(Light)
        spawn(function() 
            while task.wait() do 
                if Light then 
                    game.Lighting.Ambient = Color3.new(1, 1, 1) 
                else 
                    game.Lighting.Ambient = Color3.new(0, 0, 0) 
                end 
            end 
        end)
    end
})
