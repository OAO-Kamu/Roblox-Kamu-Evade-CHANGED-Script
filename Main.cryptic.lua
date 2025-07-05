if game.placeId == 9872472334 then

repeat task.wait() until game:IsLoaded();

if setfflag then setfflag("OutlineSelection", "true") end


local ReplicatedStorage = game:GetService("ReplicatedStorage");
local CoreGui = game:GetService("CoreGui");
local Players = game:GetService("Players");
local Workspace = game:GetService("Workspace");
local Lighting = game:GetService("Lighting");
local VirtualInputManager = game:GetService("VirtualInputManager");

local Events = ReplicatedStorage:WaitForChild("Events", 1337)

local Player = Players.LocalPlayer;

local library = loadstring(game:HttpGet("https://github.com/GoHamza/AppleLibrary/blob/main/main.lua?raw=true"))()

local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/SimpleHighlightESP.lua"))()

local Highlights_Active = false;
local AI_ESP = false;
local GodMode_Enabled = false;
local No_CamShake = false;

for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.Idled)) do v:Disable() end

function Simple_Create(base, name, trackername, studs)
    local bb = Instance.new('BillboardGui', game.CoreGui)
    bb.Adornee = base
    bb.ExtentsOffset = Vector3.new(0,1,0)
    bb.AlwaysOnTop = true
    bb.Size = UDim2.new(0,6,0,6)
    bb.StudsOffset = Vector3.new(0,1,0)
    bb.Name = trackername

    local frame = Instance.new('Frame', bb)
    frame.ZIndex = 10
    frame.BackgroundTransparency = 0.3
    frame.Size = UDim2.new(1,0,1,0)
    frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)

    local txtlbl = Instance.new('TextLabel', bb)
    txtlbl.ZIndex = 10
    txtlbl.BackgroundTransparency = 1
    txtlbl.Position = UDim2.new(0,0,0,-48)
    txtlbl.Size = UDim2.new(1,0,10,0)
    txtlbl.Font = 'ArialBold'
    txtlbl.FontSize = 'Size12'
    txtlbl.Text = name
    txtlbl.TextStrokeTransparency = 0.5
    txtlbl.TextColor3 = Color3.fromRGB(255, 0, 0)

    local txtlblstud = Instance.new('TextLabel', bb)
    txtlblstud.ZIndex = 10
    txtlblstud.BackgroundTransparency = 1
    txtlblstud.Position = UDim2.new(0,0,0,-35)
    txtlblstud.Size = UDim2.new(1,0,10,0)
    txtlblstud.Font = 'ArialBold'
    txtlblstud.FontSize = 'Size12'
    txtlblstud.Text = tostring(studs) .. " 米"
    txtlblstud.TextStrokeTransparency = 0.5
    txtlblstud.TextColor3 = Color3.new(255,255,255)
end

function ClearESP(espname)
    for _,v in pairs(game.CoreGui:GetChildren()) do
        if v.Name == espname and v:isA('BillboardGui') then
            v:Destroy()
        end
    end
end

local window = library:init("CHANGED| |Evade| |Bate2", true, Enum.KeyCode.RightShift, true)

window:Divider("补足遗憾")

local Atab = window:Section("主要/玩家 | Main/Player")

Atab:Divider("⬇️自动刷活动物品 | Auto Farm Event Items⬇️")

Atab:Switch("开/关 | ON/OFF", false, function(Value)
getgenv().farm = Value

   local Players = game:GetService("Players")
local VirtualUser = game:GetService("VirtualUser")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local tickets = game:GetService("Workspace"):FindFirstChild("Game") and game:GetService("Workspace").Game:FindFirstChild("Effects") and game:GetService("Workspace").Game.Effects:FindFirstChild("Tickets")

player.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

if tickets then
    while getgenv().farm do
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

        if character and humanoidRootPart then
            if character:GetAttribute("Downed") then
                ReplicatedStorage.Events.Player.ChangePlayerMode:FireServer(true)
            end
            
            for _, ticket in ipairs(tickets:GetChildren()) do
                local ticketPart = ticket:FindFirstChild("HumanoidRootPart")
                if ticketPart then
                    humanoidRootPart.CFrame = ticketPart.CFrame
                    task.wait(0.1)
                end
            end
        end
        task.wait(1)
    end
end
end)
Atab:Divider("玩家/功能")

Atab:TextField("移动速度 | speed power", "Input...", function(val)
       pcall(function()
        local Character = Player.Character;
        Character.Humanoid:SetAttribute("RealSpeed", tonumber(val));
    end)
end)

Atab:TextField("跳跃高度 | jump power", "Input...", function(val)
       pcall(function()
        local Character = Player.Character;
        Character.Humanoid:SetAttribute("RealJumpHeight", tonumber(val));
    end)
end)

Atab:Button("高亮 | all light", function()
    local light = Instance.new("PointLight", Character.HumanoidRootPart)
    light.Brightness = .3
    light.Range = 10000

    Lighting.TimeOfDay = "14:00:00"
    Lighting.FogEnd = 10000;
    Lighting.Brightness = 2;
    Lighting.Ambient = Color3.fromRGB(255,255,255)
    Lighting.FogColor = Color3.fromRGB(255,255,255)
end)

Atab:Button("无敌[假] | God Mode [lie]", function()
     local Character = Player.Character or Player.CharacterAdded:Wait()
    local Hum = Character:WaitForChild("Humanoid")
    Hum.Parent = nil;
    Hum.Parent = Character;
     print("Button clicked.")
end)

Atab:Switch("低廉无敌 | Leep god mode", false, function(bool)
       GodMode_Enabled = bool;
    if bool then
        local Character = Player.Character or Player.CharacterAdded:Wait()
        local Hum = Character:WaitForChild("Humanoid")
        Hum.Parent = nil;
        Hum.Parent = Char;
    en
end)

Atab:Button("炸服 | Crash server", function()
    local Reset = Events:FindFirstChild("Reset")
    local Respawn = Events:FindFirstChild("Respawn")
    while task.wait() do
        if Reset and Respawn then
            Reset:FireServer()
            Respawn:FireServer()
        end
    end
end)

Atab:Button("换服 | hop server", function()
    local Reset = Events:FindFirstChild("Reset")
    local Respawn = Events:FindFirstChild("Respawn")

    if Reset and Respawn then
        Reset:FireServer();
        task.wait(2)
        Respawn:FireServer();
    end
end)

window:Divider("⬇️视觉效果 | Vision⬇️")

local Btab = window:Section("ESP系列 | ESP Series")

Btab:Divider("关于透视")

Btab:Switch("显示 NextBot | Display NextBot", false, function(bool)
       AI_ESP = bool;
end)

Btab:Button("显示 Player | Display Player", function()
    ESP:ClearESP();
    Highlights_Active = true;

    for i, v in ipairs(Players:GetPlayers()) do
        if v ~= Player then
            v.CharacterAdded:Connect(function(Char)
                ESP:AddOutline(Char)
                ESP:AddNameTag(Char)
            end)

            if v.Character then
                ESP:AddOutline(v.Character)
                ESP:AddNameTag(v.Character)
            end
        end
    end
    
   window:TempNotify("c00lkidd：", "Full now funs!", "rbxassetid://12608259004")
end)
Btab:Divider("关于视角")

Btab:Switch("无视角抖动 | No perspective shake", false, function(bool)
    No_CamShake = bool;
end)

Btab:Divider("关于动作/服饰")

Btab:Button("服饰:AlphaTester | Skins AlphaTester", function()
Events.UI.Purchase:InvokeServer("Skins", "AlphaTester")
end)
Btab:Button("服饰:Boombox | Skins Boombox", function()
Events.UI.Purchase:InvokeServer("Skins", "Boombox")
end)
Btab:Button("表情:Test | Emotes Test", function()
    Events.UI.Purchase:InvokeServer("Emotes", "Test")
end)

window:GreenButton(function()
   print("You clicked the green button!")
end)

window:Divider("信息 | info")

local info = window:Section("作者的信息")

info:Label("现在放假了,中/小/大学生也很多\n 我在这里祝你们暑假快乐,天天开心awa")

info:Label("还有就是我上高中啦~:D\n那我也祝我自己天天开心吧QAQ")


--- [[ Helpers / Loop Funcs ]]

game:GetService("Players").PlayerAdded:Connect(function(Player)
    Player.CharacterAdded:Connect(function(Char)
        if Highlights_Active then
            ESP:AddOutline(Char)
            ESP:AddNameTag(Char)
        end
    end)
end)

Player.CharacterAdded:Connect(function(Char)
    local Hum = Char:WaitForChild("Humanoid", 1337);
    if GodMode_Enabled then
        Hum.Parent = nil;
        Hum.Parent = Char;
    end
end)

task.spawn(function()
    while task.wait(0.05) do
        if AI_ESP then
            pcall(function()
                ClearESP("AI_Tracker")
                local GamePlayers = Workspace:WaitForChild("Game", 1337).Players;
                for i,v in pairs(GamePlayers:GetChildren()) do
                    if not game.Players:FindFirstChild(v.Name) then
                        local studs = Player:DistanceFromCharacter(v.PrimaryPart.Position)
                        Simple_Create(v.HumanoidRootPart, v.Name, "AI_Tracker", math.floor(studs + 0.5))
                    end
                end
            end)
        else
            ClearESP("AI_Tracker");
        end
    end
end)

task.spawn(function()
    while task.wait() do
        if No_CamShake then
            Player.PlayerScripts:WaitForChild("CameraShake", 1234).Value = CFrame.new(0,0,0) * CFrame.Angles(0,0,0);
        end
    end


getgenv().InviteCode = "wSjHbHM9j9"--必填
sectionA:Select()