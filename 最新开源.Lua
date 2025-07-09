local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
--[[
local time = os.time()
local date = os.date("*t", time)

local hour = date.hour % 12
if hour == 0 then
    hour = 12
end

local min = string.format("%02d", date.min)
local sec = string.format("%02d", date.sec)

local ampm = date.hour >= 12 and "PM" or "AM"
]]
local Window = Rayfield:CreateWindow({
   Name = "CHANGED 被遗弃 | Forsaken | NOEKemono_Kamu",
   Icon = 13195169339, 
   LoadingTitle = "Forsaken | 欢迎 “YWY”使用:3",
   LoadingSubtitle = "NOEKemono_Kamu",
   Theme = "Green",
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "saver", 
      FileName = "K"
   },

   Discord = {
      Enabled = false,
      Invite = "noinvitelink", 
      RememberJoins = true 
   },

   KeySystem = false,
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", 
      FileName = "Key", 
      SaveKey = true, --
      GrabKeyFromSite = false,
      Key = {"Hello"} 
   }
})
local PlayerTab = Window:CreateTab("玩家")
local misctab = Window:CreateTab("功能")
local EspTab = Window:CreateTab("绘制")
local ATab = Window:CreateTab("体力")
local AimTab = Window:CreateTab("自瞄")
local gentab = Window:CreateTab("电机")
local MTab = Window:CreateTab("美化") 
local DiscordTab = Window:CreateTab("信息")
local SettingsTab = Window:CreateTab("设置")
local ActiveSpeedBoost,ActiveAutoUseCoinFlip,ActiveEspSurvivors,ActiveNoStun,ActiveEspKillers,ActiveEspGenerator,ActiveEspItems,ActiveInfiniteStamina,ActiveEspRagdolls,ActiveAutoGenerator,AutoKillSurvivors = false,false,false,false,false,false,false,false,false,false

Rayfield:Notify({
   Title = "检查版本ing…",
   Content = "✅ |“YWY”定制版 
   awa N/A Beta.load =...'vion'...",
   Duration = 5,
   Image = 5098434948,
})

local isHighlightActive = false

local toolhighlightactive = false

local hawktuahactive = false

local isCorruptNatureEspActive = false

local isSurvivorUtilEspActive = false

local run = false

local delay

local isSurvivorHighlightActive = false

local givepizza = false

local connections = {}

local isKillerHighlightActive = false

local hideplayerbar = false

local VirtualBallsManager = game:GetService('VirtualInputManager')

local jumppowerenabled = false

local survivorutil = {
    "007n7",
    "BuildermanSentry",
    "BuildermanDispenser",
    "Pizza",
    "BuildermanSentryEffectRange"
}

local aimbot1x1sounds = {
    "rbxassetid://79782181585087",
    "rbxassetid://128711903717226"
}

local chanceaimbotsounds = {
    "rbxassetid://201858045",
    "rbxassetid://139012439429121"
}

local johnaimbotsounds = {
    "rbxassetid://109525294317144"
}

local jasonaimbotsounds = {
    "rbxassetid://112809109188560",
    "rbxassetid://102228729296384"
}

local shedaimbotsounds = {
    "rbxassetid://12222225",
    "rbxassetid://83851356262523"
}

local guestsounds = {
    "rbxassetid://609342351"
}

local hawktuahactivatesound = {
    "rbxassetid://110759725172567"
}

local hakariactive = false

local quietactive = false

local stam = false

local connection

local chanceaim = false

local chanceaimbotLoop

local jasonaimbotloop

local genshouldloop = false

local genactive = false

local aimbot1x1loop

local johnloop

local guestloop

local shedloop

local player = game.Players.LocalPlayer

local aimbot1x1 = false

local johnaim = false

local connection

local jasonaim = false

local shedaim = false

local guestaim = false

local function initialize()   

    local function toggleHighlightGen(state)
        isHighlightActive = state 

        local function applyGeneratorHighlight(generator)
            if generator.Name == "Generator" then
                local existingHighlight = generator:FindFirstChild("GeneratorHighlight")
                local progress = generator:FindFirstChild("Progress")

                if isHighlightActive then
                    if not existingHighlight then
                        local genhighlight = Instance.new("Highlight")
                        genhighlight.Parent = generator
                        genhighlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        genhighlight.Name = "GeneratorHighlight"
                    end
                else
                    if existingHighlight then
                        existingHighlight:Destroy()
                    end
                    return
                end

                if progress then
                    if progress.Value == 100 then
                        local highlight = generator:FindFirstChild("GeneratorHighlight")
                        if highlight then
                            highlight:Destroy()
                        end
                        return
                    end

                    progress:GetPropertyChangedSignal("Value"):Connect(function()
                        if progress.Value == 100 then
                            local highlight = generator:FindFirstChild("GeneratorHighlight")
                            if highlight then
                                highlight:Destroy()
                            end
                        elseif isHighlightActive and not generator:FindFirstChild("GeneratorHighlight") then
                            local genhighlight = Instance.new("Highlight")
                            genhighlight.Parent = generator
                            genhighlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                            genhighlight.Name = "GeneratorHighlight"
                        end
                    end)
                end
            end
        end

        for _, v in pairs(game.Workspace.Map.Ingame.Map:GetChildren()) do
            applyGeneratorHighlight(v)
        end

        game.Workspace.Map.Ingame.Map.ChildAdded:Connect(function(child)
            applyGeneratorHighlight(child)
        end)
    end



    local function togglehidebar(state)
        hideplayerbar = state 
        local playergui = player.PlayerGui
        local playerinfo = playergui.TemporaryUI.PlayerInfo

        if hideplayerbar then
            playerinfo.CurrentSurvivors.Visible = false
            playerinfo.PlayerIcon.Image = "rbxassetid://12549056837"
        else
            playerinfo.CurrentSurvivors.Visible = true
        end
    end


    local function hawktuahmode(state)
        if player.Character.Name ~= "c00lkidd" then
            Rayfield:Notify{Title = "你现在不是酷小孩!", Duration = 5}
            return end
        local TS = game:GetService("TweenService")
        hawktuahactive = state
    if state then
        Rayfield:Notify{Title = "DM", Content = "hawk tuah mode", Duration = 10}
    end

        game.DescendantAdded:Connect(function(descendant)
            for _, v in pairs(hawktuahactivatesound) do
            if descendant.Name == v then
                if hawktuahactive then
                    local propout = {
                        ImageTransparency = 1
                    }

                    local propin = {
                        ImageTransparency = 0
                    }

                    local screengui = Instance.new("ScreenGui")
                    local frame = Instance.new("Frame")
                    local image = Instance.new("ImageLabel")
                    local sound = Instance.new("Sound")
                    sound.Parent = game.Workspace
                    sound.SoundId = "rbxassetid://17787027130"
                    sound:Play()

                    screengui.Parent = game.Players.LocalPlayer.PlayerGui
                    screengui.IgnoreGuiInset = true
                    frame.Parent = screengui
                    image.Parent = frame

                    frame.Size = UDim2.new(1,0,1,0)
                    frame.Position = UDim2.new(0, 0, 0, 0)
                    frame.BackgroundTransparency = 1

                    image.Size = UDim2.new(1,0,1,0)
                    image.Position = UDim2.new(0, 0, 0, 0)
                    image.BackgroundTransparency = 1

                    image.Image = "http://www.roblox.com/asset/?id=100505038126957"

                    local tweeninfoI = TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.In)
                    local tween = TS:Create(image,tweeninfoI, propout)
                    tween:play()


                    wait(1)

                    local tweeninfoII = TweenInfo.new(0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
                    local tweenI = TS:Create(image,tweeninfoII, propin)
                    tweenI:play()
                    screengui:Destroy()
                end
            end
        end
        end)
    end



    local function Do1x1x1x1Popups() -- creds to ivan
        while true do
            if Do1x1PopupsLoop then
                local player = game:GetService("Players").LocalPlayer
                local popups = player.PlayerGui.TemporaryUI:GetChildren()

                for _, i in ipairs(popups) do
                    if i.Name == "1x1x1x1Popup" then
                        local centerX = i.AbsolutePosition.X + (i.AbsoluteSize.X / 2)
                        local centerY = i.AbsolutePosition.Y + (i.AbsoluteSize.Y / 2)

                        VirtualBallsManager:SendMouseButtonEvent(centerX, centerY, Enum.UserInputType.MouseButton1.Value, true, player.PlayerGui, 1)
                        VirtualBallsManager:SendMouseButtonEvent(centerX, centerY, Enum.UserInputType.MouseButton1.Value, false, player.PlayerGui, 1)
                    end
                end
            end
            task.wait(0.1)
        end
    end


    local function instantsolvegen()
        for i, v in pairs(game.Workspace.Map.Ingame.Map:GetChildren()) do
            if v.name == "Generator" then
                local num = 0
                repeat
                num += 1
                v:WaitForChild("Remotes"):WaitForChild("RE"):FireServer()
                until num == 4
            end
        end
    end

    local function solvegen()
        for i, v in pairs(game.Workspace.Map.Ingame.Map:GetChildren()) do
            if v.name == "Generator" then
                v:WaitForChild("Remotes"):WaitForChild("RE"):FireServer()
            end
        end
    end


    local function instantsolvegenhell()
        for i, v in pairs(game.Workspace.Map.Ingame.Map.Generators:GetChildren()) do
            if v:IsA("Model") then
                local num = 0
                repeat
                num += 1
                v:WaitForChild("Remotes"):WaitForChild("RE"):FireServer()
                until num == 4
            end
        end
    end

    local function highlighttools(state)
        toolhighlightActive = state

        local function applyHighlight(tool)
            if toolhighlightActive then
                local existinghighlight = tool:FindFirstChild("ToolHighlight")
                if not existinghighlight then
                    local toolhighlight = Instance.new("Highlight")
                    toolhighlight.Name = "ToolHighlight"
                    toolhighlight.Parent = tool
                    toolhighlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop

                    if tool.Name == "Medkit" then
                        toolhighlight.FillColor = Color3.fromRGB(0, 255, 0)
                    elseif tool.Name == "BloxyCola" then
                        toolhighlight.FillColor = Color3.fromRGB(88, 57, 39)
                    end
                end
            else
                local existinghighlight = tool:FindFirstChild("ToolHighlight")
                if existinghighlight then
                    existinghighlight:Destroy()
                end
            end
        end

        for _, v in pairs(game.Workspace.Map.Ingame:GetChildren()) do
            if v:IsA("Tool") then
                applyHighlight(v)
            end
        end

        game.Workspace.Map.Ingame.ChildAdded:Connect(function(child)
            if child:IsA("Tool") then
                applyHighlight(child)
            end
        end)
    end




    local function givemesomepizza(state)
        if not state then

            for _, v in pairs(connections) do
                v:Disconnect()
            end
            table.clear(connections)
            return
        end


        local function tp(child)
            if child:IsA("BasePart") and child.Name == "Pizza" then
                local player = game.Players.LocalPlayer
                if player and player.Character then
                    local hrp = player.Character:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        child.CFrame = hrp.CFrame
                    end
                end
            end
        end


        local function watchtower()
            local map = workspace:FindFirstChild("Map")
            local insession = map and map:FindFirstChild("Ingame")

            if insession then

                for _, child in pairs(insession:GetChildren()) do
                    tp(child)
                end

                table.insert(connections, insession.ChildAdded:Connect(tp))
            end
        end


        watchtower()
    end

    local function setdelay(value)
        delay = value

    end



    local function autogen(state)
        run = state

        local debounce = {}



        while run do
            task.wait()
            for _, v in pairs(game.Workspace.Map.Ingame.Map:GetChildren()) do
                if v.Name == "Generator" then

                    if not debounce[v] then
                        debounce[v] = true
                        v:WaitForChild("Remotes"):WaitForChild("RE"):FireServer()
                        task.delay(delay, function() debounce[v] = nil end)
                    end
                end
            end
        end
    end







    local function corruptnatureesp(state)
        isCorruptNatureEspActive = state
        for i, v in pairs(game.Workspace.Map.Ingame:GetChildren()) do
            if v:IsA("Model") then
                local existingHighlight = v:FindFirstChild("CorruptNatureHighlight")
                if isCorruptNatureEspActive then
                    if not existingHighlight then
                        if v.Name == "HumanoidRootProjectile" or v.Name == "PizzaDeliveryRig" or v.Name == "Bunny" or v.Name == "Mafiaso1" or v.Name == "Mafiaso2" or v.Name == "Mafiaso3" then
                            local highlight = Instance.new("Highlight")
                            highlight.Name = "CorruptNatureHighlight"
                            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                            highlight.Parent = v
                        end
                    end
                else
                    if existingHighlight then
                        existingHighlight:Destroy()
                    end
                end
            end
        end
    end


    local function survivorutilesp(state)
        isSurvivorUtilEspActive = state

        local function applySurvivorUtilHighlight(model)
            local existingHighlight = model:FindFirstChild("SurvivorUtilHighlight")
            if isSurvivorUtilEspActive then
                if not existingHighlight then
                    for _, util in pairs(survivorutil) do
                        if model.Name == util then
                            local highlight = Instance.new("Highlight")
                            highlight.Name = "SurvivorUtilHighlight"
                            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                            highlight.FillColor = Color3.fromRGB(255,255,255)
                            highlight.FillTransparency = 0.5
                            highlight.Parent = model
                        end
                    end
                end
            else
                if existingHighlight then
                    existingHighlight:Destroy()
                end
            end
        end

        for _, v in pairs(game.Workspace.Map.Ingame:GetChildren()) do
            if v:IsA("Model") or v:IsA("Part") then
                applySurvivorUtilHighlight(v)
            end
        end

        game.Workspace.Map.Ingame.ChildAdded:Connect(function(child)
            if child:IsA("Model") or child:IsA("Part") then
                applySurvivorUtilHighlight(child)
            end
        end)
    end


    local function activatethehakari(state)
        local char = player.Character or player.CharacterAdded:Wait()
        local humanoid = char:WaitForChild("Humanoid")
        local rootPart = char:WaitForChild("HumanoidRootPart")

        hakariactive = state

        if hakariactive then
            humanoid.PlatformStand = true
            humanoid.JumpPower = 0

            local bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
            bodyVelocity.Velocity = Vector3.zero
            bodyVelocity.Parent = rootPart

            local animation = Instance.new("Animation")
            animation.AnimationId = "rbxassetid://138019937280193"
            local animationTrack = humanoid:LoadAnimation(animation)
            animationTrack:Play()

            local sound = Instance.new("Sound")
            sound.SoundId = "rbxassetid://87166578676888"
            sound.Parent = rootPart
            sound.Volume = 0.5
            sound.Looped = true
            sound:Play()

            local effect = game.ReplicatedStorage.Assets.Emotes.HakariDance.HakariBeamEffect:Clone()
            effect.Name = "PlayerEmoteVFX"
            effect.CFrame = char.PrimaryPart.CFrame * CFrame.new(0, -1, -0.3)
            effect.WeldConstraint.Part0 = char.PrimaryPart
            effect.WeldConstraint.Part1 = effect
            effect.Parent = char
            effect.CanCollide = false

            local args = {
                [1] = "PlayEmote",
                [2] = "Animations",
                [3] = "HakariDance"
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(args))

            animationTrack.Stopped:Connect(function()
                humanoid.PlatformStand = false
                if bodyVelocity and bodyVelocity.Parent then
                    bodyVelocity:Destroy()
                end
            end)
        else
            humanoid.PlatformStand = false
            humanoid.JumpPower = 0 

            local bodyVelocity = rootPart:FindFirstChildOfClass("BodyVelocity")
            if bodyVelocity then
                bodyVelocity:Destroy()
            end

            local sound = rootPart:FindFirstChildOfClass("Sound")
            if sound then
                sound:Stop()
                sound:Destroy()
            end

            local effect = char:FindFirstChild("PlayerEmoteVFX")
            if effect then
                effect:Destroy()
            end

            for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
                if track.Animation.AnimationId == "rbxassetid://138019937280193" then
                    track:Stop()
                end
            end
        end
    end


    local function activatethesilly(state)

        local char = player.Character or player.CharacterAdded:Wait()
        local humanoid = char:WaitForChild("Humanoid")
        local rootPart = char:WaitForChild("HumanoidRootPart")
        sillyactive = state

        if sillyactive then
            humanoid.PlatformStand = true
            humanoid.JumpPower = 0

            local bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
            bodyVelocity.Velocity = Vector3.zero
            bodyVelocity.Parent = rootPart


            local emoteScript = require(game:GetService("ReplicatedStorage").Assets.Emotes.Shucks)
            emoteScript.Created({Character = char})

            local animation = Instance.new("Animation")
            animation.AnimationId = "rbxassetid://74238051754912"
            local animationTrack = humanoid:LoadAnimation(animation)
            animationTrack:Play()

            local sound = Instance.new("Sound")
            sound.SoundId = "rbxassetid://123236721947419"
            sound.Parent = rootPart
            sound.Volume = 0.5
            sound.Looped = false
            sound:Play()

            local args = {
                [1] = "PlayEmote",
                [2] = "Animations",
                [3] = "Shucks"
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(args))

            animationTrack.Stopped:Connect(function()
                humanoid.PlatformStand = false
                if bodyVelocity and bodyVelocity.Parent then
                    bodyVelocity:Destroy()
                end


                local saw = char:FindFirstChild("Saw")
                if saw then saw:Destroy() end

                local playerHand = char:FindFirstChild("PlayerEmoteHand")
                if playerHand then playerHand:Destroy() end
            end)
        else

            humanoid.PlatformStand = false
            humanoid.JumpPower = 0

            local saw = char:FindFirstChild("Saw")
            if saw then saw:Destroy() end

            local playerHand = char:FindFirstChild("PlayerEmoteHand")
            if playerHand then playerHand:Destroy() end

            local bodyVelocity = rootPart:FindFirstChildOfClass("BodyVelocity")
            if bodyVelocity then
                bodyVelocity:Destroy()
            end

            local sound = rootPart:FindFirstChildOfClass("Sound")
            if sound then
                sound:Stop()
                sound:Destroy()
            end

            for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
                if track.Animation.AnimationId == "rbxassetid://74238051754912" then
                    track:Stop()
                end
            end
        end
    end


    local function activatethequiet(state)
        local char = player.Character or player.CharacterAdded:Wait()
        local humanoid = char:WaitForChild("Humanoid")
        local rootPart = char:WaitForChild("HumanoidRootPart")
        sillyactive = state

        if sillyactive then
            humanoid.PlatformStand = true
            humanoid.JumpPower = 0

            local bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
            bodyVelocity.Velocity = Vector3.zero
            bodyVelocity.Parent = rootPart

            local emoteScript = require(game:GetService("ReplicatedStorage").Assets.Emotes.MissTheQuiet)
            emoteScript.Created({Character = char})

            local animation = Instance.new("Animation")
            animation.AnimationId = "rbxassetid://100986631322204"
            local animationTrack = humanoid:LoadAnimation(animation)
            animationTrack:Play()

            local sound = Instance.new("Sound")
            sound.SoundId = "rbxassetid://131936418953291"
            sound.Parent = rootPart
            sound.Volume = 0.5
            sound.Looped = false
            sound:Play()

            local args = {
                [1] = "PlayEmote",
                [2] = "Animations",
                [3] = "MissTheQuiet"
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(args))

            animationTrack.Stopped:Connect(function()
                humanoid.PlatformStand = false
                if bodyVelocity and bodyVelocity.Parent then
                    bodyVelocity:Destroy()
                end

                local assetsToDestroy = {"EmoteHatAsset", "EmoteLighting", "PlayerEmoteHand"}
                for _, assetName in ipairs(assetsToDestroy) do
                    local asset = char:FindFirstChild(assetName)
                    if asset then asset:Destroy() end
                end
            end)
        else
            humanoid.PlatformStand = false
            humanoid.JumpPower = 0

            local assetsToDestroy = {"EmoteHatAsset", "EmoteLighting", "PlayerEmoteHand"}
            for _, assetName in ipairs(assetsToDestroy) do
                local asset = char:FindFirstChild(assetName)
                if asset then asset:Destroy() end
            end

            local bodyVelocity = rootPart:FindFirstChildOfClass("BodyVelocity")
            if bodyVelocity then
                bodyVelocity:Destroy()
            end

            local sound = rootPart:FindFirstChildOfClass("Sound")
            if sound then
                sound:Stop()
                sound:Destroy()
            end

            for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
                if track.Animation.AnimationId == "rbxassetid://100986631322204" then
                    track:Stop()
                end
            end
        end
    end


    local function activatethesilly2(state)
        local char = player.Character or player.CharacterAdded:Wait()
        local humanoid = char:WaitForChild("Humanoid")
        local rootPart = char:WaitForChild("HumanoidRootPart")

        sillyactive = state

        if sillyactive then
            humanoid.PlatformStand = true
            humanoid.JumpPower = 0

            local bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
            bodyVelocity.Velocity = Vector3.zero
            bodyVelocity.Parent = rootPart


            local animation = Instance.new("Animation")
            animation.AnimationId = "rbxassetid://74238051754912"
            local animationTrack = humanoid:LoadAnimation(animation)
            animationTrack:Play()

            local sound = Instance.new("Sound")
            sound.SoundId = "rbxassetid://123236721947419"
            sound.Parent = rootPart
            sound.Volume = 0.5
            sound.Looped = false
            sound:Play()

            local args = {
                [1] = "PlayEmote",
                [2] = "Animations",
                [3] = "Shucks"
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(args))

            animationTrack.Stopped:Connect(function()
                humanoid.PlatformStand = false
                if bodyVelocity and bodyVelocity.Parent then
                    bodyVelocity:Destroy()
                end
            end)
        else
            humanoid.PlatformStand = false
            humanoid.JumpPower = 0

            local bodyVelocity = rootPart:FindFirstChildOfClass("BodyVelocity")
            if bodyVelocity then
                bodyVelocity:Destroy()
            end

            local sound = rootPart:FindFirstChildOfClass("Sound")
            if sound then
                sound:Stop()
                sound:Destroy()
            end

            for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
                if track.Animation.AnimationId == "rbxassetid://74238051754912" then
                    track:Stop()
                end
            end
        end
    end




    local function survivorHighlighter(state)
        isSurvivorHighlightActive = state

        local function applySurvivorHighlight(model)
            if model:IsA("Model") and model:FindFirstChild("Head") then
                local existingBillboard = model.Head:FindFirstChild("billboard")
                local existingHighlight = model:FindFirstChild("HiThere")

                if isSurvivorHighlightActive then
                    if not existingBillboard then
                        local billboard = Instance.new("BillboardGui")
                        billboard.Name = "billboard"
                        billboard.Size = UDim2.new(0, 100, 0, 50)
                        billboard.StudsOffset = Vector3.new(0, 2, 0)
                        billboard.AlwaysOnTop = true
                        billboard.Parent = model.Head

                        local textLabel = Instance.new("TextLabel", billboard)
                        textLabel.Size = UDim2.new(1, 0, 1, 0)
                        textLabel.Text = model.Name
                        textLabel.TextColor3 = Color3.new(1, 1, 1)
                        textLabel.TextStrokeTransparency = 0
                        textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
                        textLabel.BackgroundTransparency = 1
                    end

                    if not existingHighlight then
                        local highlight = Instance.new("Highlight")
                        highlight.Name = "HiThere"
                        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        highlight.FillColor = Color3.fromRGB(0, 255, 0)
                        highlight.Parent = model
                    end
                else
                    if existingBillboard then
                        existingBillboard:Destroy()
                    end
                    if existingHighlight then
                        existingHighlight:Destroy()
                    end
                end
            end
        end

        for _, v in pairs(game.Workspace.Players.Survivors:GetChildren()) do
            applySurvivorHighlight(v)
        end

        game.Workspace.Players.Survivors.ChildAdded:Connect(function(child)
            applySurvivorHighlight(child)
        end)
    end



    local function killerHighlighter(state)
        isKillerHighlightActive = state

        local function applyKillerHighlight(model)
            if model:IsA("Model") and model:FindFirstChild("Head") then
                local existingBillboard = model.Head:FindFirstChild("billboard")
                local existingHighlight = model:FindFirstChild("HiThere")

                if isKillerHighlightActive then
                    if not existingBillboard then
                        local billboard = Instance.new("BillboardGui")
                        billboard.Name = "billboard"
                        billboard.Size = UDim2.new(0, 100, 0, 50)
                        billboard.StudsOffset = Vector3.new(0, 2, 0)
                        billboard.AlwaysOnTop = true
                        billboard.Parent = model.Head

                        local textLabel = Instance.new("TextLabel", billboard)
                        textLabel.Size = UDim2.new(1, 0, 1, 0)
                        textLabel.Text = model.Name
                        textLabel.TextColor3 = Color3.new(1, 0, 0)
                        textLabel.TextStrokeTransparency = 0
                        textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
                        textLabel.BackgroundTransparency = 1
                    end

                    if not existingHighlight then
                        local highlight = Instance.new("Highlight")
                        highlight.Name = "HiThere"
                        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        highlight.FillColor = Color3.fromRGB(255, 0, 0)
                        highlight.Parent = model
                    end
                else
                    if existingBillboard then
                        existingBillboard:Destroy()
                    end
                    if existingHighlight then
                        existingHighlight:Destroy()
                    end
                end
            end
        end

        for _, v in pairs(game.Workspace.Players.Killers:GetChildren()) do
            applyKillerHighlight(v)
        end

        game.Workspace.Players.Killers.ChildAdded:Connect(function(child)
            applyKillerHighlight(child)
        end)
    end

    local function bringbackjumppower(state)
        jumppowerenabled = state

        if jumppowerenabled then
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
        else
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = 0
        end

    end

    local function speedmulti(value)
        game.Players.LocalPlayer.Character.SpeedMultipliers.Sprinting.Value = value
    end

    local function bringbackjumppowerslider(value)

        if jumppowerenabled then
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
        else
           return
        end

    end

    local function FOVmulti(value)
        game.Players.LocalPlayer.Character.FOVMultipliers.FOVSetting.Value = value
    end

    local function kaiguyskin()      
        if player.Character.Name ~= "Guest1337" then
                    Rayfield:Notify{Title = "错误", Content = "你现在不是 1337!", Duration = 5}
                    return end
            for _, v in pairs(player.Character:GetChildren()) do
                if v:IsA("Shirt") then
                    v:Destroy()
                end

                if v:IsA("Pants") then
                    v:Destroy()
                end

                local headband = Instance.new("Accessory")
                local scarf = Instance.new("Accessory")
                local shirt = Instance.new("Shirt")
                local pants = Instance.new("Pants")
                --
                local headbandhandle = Instance.new("Part")
                local scarfhandle = Instance.new("Part")
                local headbandhandleattach = Instance.new("Attachment")
                local scarfhandleattach = Instance.new("Attachment")
                local headbandweld = Instance.new("Weld")
                local scarfweld = Instance.new("Weld")
                scarfhandle.Name = "Handle"
                headbandhandle.Name = "Handle"
                scarfhandle.CanCollide = false
                headbandhandle.CanCollide = false
                --
                local headbandmesh = Instance.new("SpecialMesh")
                local scarfmesh = Instance.new("SpecialMesh")
                --
                shirt.ShirtTemplate = "http://www.roblox.com/asset/?id=836903658"
                pants.PantsTemplate = "http://www.roblox.com/asset/?id=731578592"
                shirt.Parent = player.Character
                pants.Parent = player.Character
                 --
                headband.Parent = player.Character
                scarf.Parent = player.Character
                scarfhandle.Parent = scarf
                headbandhandle.Parent = headband
                headbandhandleattach.Parent = headbandhandle
                scarfhandleattach.Parent = scarfhandle
                headbandmesh.Parent = headbandhandle
                scarfmesh.Parent = scarfhandle
                headbandhandle.Color = Color3.fromRGB(27, 42, 53)
                scarfhandle.Color = Color3.fromRGB(27, 42, 53)
                --
                headbandweld.Parent = headbandhandle
                headbandweld.Name = "AccessoryWeld"
                headbandweld.Part0 = headbandhandle
                headbandweld.Part1 = player.Character.Head
                headbandweld.C0 = CFrame.new(0, 0, 0)
                headbandweld.C1 = CFrame.new(0, 0, 0)
                --
                scarfweld.Parent = scarfhandle
                scarfweld.Name = "AccessoryWeld"
                scarfweld.Part0 = scarfhandle
                scarfweld.Part1 = player.Character.Torso
                scarfweld.C0 = CFrame.new(0, -0.4, 0)
                scarfweld.C1 = CFrame.new(0, 0, 0)
                --
                headbandmesh.MeshId = "http://www.roblox.com/asset/?id=20407184"
                headbandmesh.Scale = Vector3.new(1.103, 1.071, 1.103)
                scarfmesh.MeshId = "http://www.roblox.com/asset/?id=99856331"
                scarfmesh.Scale = Vector3.new(1.071, 1.071, 1.071)
                scarfmesh.VertexColor = Vector3.new(1, 2, 1)
                --
                headbandhandleattach.Name = "HatAttachment"
                headbandhandleattach.CFrame = CFrame.new(0, 0.557, 0)
                scarfhandleattach.Name = "NeckAttachment"
                scarfhandleattach.CFrame = CFrame.new(0, 0.519, 0)

                local playergui = player.PlayerGui
                local playerinfo = playergui.TemporaryUI.PlayerInfo


            playerinfo.PlayerIcon.Image = "http://www.roblox.com/asset/?id=97047410245118"


            end
    end

    local function doomskin()      
        if player.Character.Name ~= "Shedletsky" then
                    Rayfield:Notify{Title = "错误", Content = "你现在不是谢德莱茨基!", Duration = 5}
                    return end
            for _, v in pairs(player.Character:GetChildren()) do
                if v:IsA("Shirt") then
                    v:Destroy()
                end

                if v:IsA("Pants") then
                    v:Destroy()
                end

                local headband = Instance.new("Accessory")

                local shirt = Instance.new("Shirt")
                local pants = Instance.new("Pants")
                local tshirt = Instance.new("ShirtGraphic")
                --
                local headbandhandle = Instance.new("Part")

                local headbandhandleattach = Instance.new("Attachment")

                local headbandweld = Instance.new("Weld")


                headbandhandle.Name = "Handle"

                headbandhandle.CanCollide = false
                --
                local headbandmesh = Instance.new("SpecialMesh")

                --
                shirt.ShirtTemplate = "http://www.roblox.com/asset/?id=1808496"
                pants.PantsTemplate = "http://www.roblox.com/asset/?id=1809861"
                tshirt.Graphic = "http://www.roblox.com/asset/?id=2426992"
                shirt.Parent = player.Character
                pants.Parent = player.Character
                tshirt.Parent = player.Character
                 --
                headband.Parent = player.Character

                headbandhandle.Parent = headband
                headbandhandleattach.Parent = headbandhandle

                headbandmesh.Parent = headbandhandle

                headbandhandle.Color = Color3.fromRGB(27, 42, 53)

                --
                headbandweld.Parent = headbandhandle
                headbandweld.Name = "AccessoryWeld"
                headbandweld.Part0 = headbandhandle
                headbandweld.Part1 = player.Character.Head
                headbandweld.C0 = CFrame.new(0, -0.5, 0)
                headbandweld.C1 = CFrame.new(0, 0, 0)
                --
                --
                headbandmesh.MeshId = "http://www.roblox.com/asset/?id=1286103"
                headbandmesh.TextureId = "rbxassetid://6858319251"
                headbandmesh.Scale = Vector3.new(0.992, 0.994, 0.992)
               if player.Character:FindFirstChild("ShedHair") then
                player.Character:FindFirstChild("ShedHair"):Destroy()
               end
                --
                headbandhandleattach.Name = "HatAttachment"
                headbandhandleattach.CFrame = CFrame.new(0, 0.557, 0)

                local playergui = player.PlayerGui
                local playerinfo = playergui.TemporaryUI.PlayerInfo


            playerinfo.PlayerIcon.Image = "http://www.roblox.com/asset/?id=118308385507069"


            end
    end



    local function chanceaimbot(state)
        chanceaim = state
        if game.Players.LocalPlayer.Character.Name ~= "Chance" and state then
            Rayfield:Notify{Title = "错误", Content = "你现在不是机会", Duration = 5}
            return 
        end
        if state then
            chanceaimbotLoop = game.Players.LocalPlayer.Character.HumanoidRootPart.ChildAdded:Connect(function(child)
                if not chanceaim then return end
                for _, v in pairs(chanceaimbotsounds) do
                    if child.Name == v  then
                        local killer = game.Workspace.Players:FindFirstChild("Killers"):FindFirstChildOfClass("Model")
                        if killer and killer:FindFirstChild("HumanoidRootPart") then
                            local killerHRP = killer.HumanoidRootPart
                            local playerHRP = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                            if playerHRP then
                                local direction = (killerHRP.Position - playerHRP.Position).Unit
                                local num = 1
                                local maxIterations = 100


                                    while num <= maxIterations do
                                        task.wait(0.01)
                                        num = num + 1
                                        workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, killerHRP.Position)
                                        playerHRP.CFrame = CFrame.lookAt(playerHRP.Position, Vector3.new(killerHRP.Position.X, killerHRP.Position.Y, killerHRP.Position.Z))
                                    end


                            end
                        end
                    end
                end
            end)
        else
            if chanceaimbotLoop then
                chanceaimbotLoop:Disconnect()
                chanceaimbotLoop = nil
            end
        end
    end

    local function shedaimbot(state)
        shedaim = state
        if game.Players.LocalPlayer.Character.Name ~= "Shedletsky" and state then
            Rayfield:Notify{Title = "错误", Content = "你现在不是谢德莱茨基!", Duration = 5}
            return
        end
        if state then
            shedloop = game.Players.LocalPlayer.Character.Sword.ChildAdded:Connect(function(child)
                if not shedaim then return end
                for _, v in pairs(shedaimbotsounds) do
                    if child.Name == v then
                        local killersFolder = game.Workspace.Players:FindFirstChild("Killers")
                        if killersFolder then
                            local killer = killersFolder:FindFirstChildOfClass("Model")
                            if killer and killer:FindFirstChild("HumanoidRootPart") then
                                local killerHRP = killer.HumanoidRootPart
                                local playerHRP = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                                if playerHRP then
                                    local num = 1
                                    local maxIterations = 100

                                    while num <= maxIterations do
                                        task.wait(0.01)
                                        num = num + 1
                                        workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, killerHRP.Position)
                                        playerHRP.CFrame = CFrame.lookAt(playerHRP.Position, killerHRP.Position)
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        else
            if shedloop then
                shedloop:Disconnect()
                shedloop = nil
            end
        end
    end

    local function guestaimbot(state)
        shedaim = state
        if game.Players.LocalPlayer.Character.Name ~= "Guest1337" and state then
            Rayfield:Notify{Title = "错误", Content = "你现在不是 1337", Duration = 5}
            return
        end
        if state then
            shedloop = game.Players.LocalPlayer.Character.HumanoidRootPart.ChildAdded:Connect(function(child)
                if not shedaim then return end
                for _, v in pairs(guestsounds) do
                    if child.Name == v then
                        local killersFolder = game.Workspace.Players:FindFirstChild("Killers")
                        if killersFolder then
                            local killer = killersFolder:FindFirstChildOfClass("Model")
                            if killer and killer:FindFirstChild("HumanoidRootPart") then
                                local killerHRP = killer.HumanoidRootPart
                                local playerHRP = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                                if playerHRP then
                                    local num = 1
                                    local maxIterations = 100

                                    while num <= maxIterations do
                                        task.wait(0.01)
                                        num = num + 1
                                        workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, killerHRP.Position)
                                        playerHRP.CFrame = CFrame.lookAt(playerHRP.Position, killerHRP.Position)
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        else
            if guestloop then
                guestloop:Disconnect()
                guestloop = nil
            end
        end
    end

    local function aimbot1x1x1x1(state)
        aimbot1x1 = state

        if game.Players.LocalPlayer.Character.Name ~= "1x1x1x1" and state then
            Rayfield:Notify{Title = "错误", Content = "你现在不是 1×4!!", Duration = 5}
            return 
        end

        if state then
            aimbot1x1loop = game.Players.LocalPlayer.Character.HumanoidRootPart.ChildAdded:Connect(function(child)
                if not aimbot1x1 then return end
                for _, v in pairs(aimbot1x1sounds) do
                    if child.Name == v then
                        local survivors = {}
                        for _, player in pairs(game.Players:GetPlayers()) do
                            if player ~= game.Players.LocalPlayer then
                                local character = player.Character
                                if character and character:FindFirstChild("HumanoidRootPart") then
                                    table.insert(survivors, character)
                                end
                            end
                        end

                        local nearestSurvivor = nil
                        local shortestDistance = math.huge  

                        for _, survivor in pairs(survivors) do
                            local survivorHRP = survivor.HumanoidRootPart
                            local playerHRP = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

                            if playerHRP then
                                local distance = (survivorHRP.Position - playerHRP.Position).Magnitude
                                if distance < shortestDistance then
                                    shortestDistance = distance
                                    nearestSurvivor = survivor
                                end
                            end
                        end

                        if nearestSurvivor then
                            local nearestHRP = nearestSurvivor.HumanoidRootPart
                            local playerHRP = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

                            if playerHRP then
                                local direction = (nearestHRP.Position - playerHRP.Position).Unit
                                local num = 1
                                local maxIterations = 100 


                                    if child.Name == "rbxassetid://79782181585087" then
                                        maxIterations = 220  
                                    end

                                while num <= maxIterations do
                                    task.wait(0.01)
                                    num = num + 1
                                    workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, nearestHRP.Position)
                                    playerHRP.CFrame = CFrame.lookAt(playerHRP.Position, Vector3.new(nearestHRP.Position.X, nearestHRP.Position.Y, nearestHRP.Position.Z))
                                end

                            end
                        end
                    end
                end
            end)
        else
            if aimbot1x1loop then
                aimbot1x1loop:Disconnect()
                aimbot1x1loop = nil
            end
        end
    end

    local function johnaimbot(state)
        johnaim = state
        if game.Players.LocalPlayer.Character.Name ~= "JohnDoe" and state then
            Rayfield:Notify{Title = "错误", Content = "你现在不是约翰 多 !", Duration = 5}
            return 
        end
            if state then
                johnloop = game.Players.LocalPlayer.Character.HumanoidRootPart.ChildAdded:Connect(function(child)
                    if not johnaim then return end
                    for _, v in pairs(johnaimbotsounds) do
                        if child.Name == v then

                            local survivors = {}
                            for _, player in pairs(game.Players:GetPlayers()) do
                                if player ~= game.Players.LocalPlayer then
                                    local character = player.Character
                                    if character and character:FindFirstChild("HumanoidRootPart") then
                                        table.insert(survivors, character)
                                    end
                                end
                            end


                            local nearestSurvivor = nil
                            local shortestDistance = math.huge  

                            for _, survivor in pairs(survivors) do
                                local survivorHRP = survivor.HumanoidRootPart
                                local playerHRP = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

                                if playerHRP then
                                    local distance = (survivorHRP.Position - playerHRP.Position).Magnitude
                                    if distance < shortestDistance then
                                        shortestDistance = distance
                                        nearestSurvivor = survivor
                                    end
                                end
                            end


                            if nearestSurvivor then
                                local nearestHRP = nearestSurvivor.HumanoidRootPart
                                local playerHRP = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                                local maxIterations = 330
                                if playerHRP then
                                    local direction = (nearestHRP.Position - playerHRP.Position).Unit
                                    local num = 1


                                        while num <= maxIterations do
                                            task.wait(0.01)
                                            num = num + 1
                                            workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, nearestHRP.Position)
                                            playerHRP.CFrame = CFrame.lookAt(playerHRP.Position, Vector3.new(nearestHRP.Position.X, nearestHRP.Position.Y, nearestHRP.Position.Z))

                                    end
                                end
                            end
                        end
                    end
                end)
            else
                if johnloop then
                    johnloop:Disconnect()
                    johnloop = nil
                end
            end
    end

    local function jasonaimbot(state)
        jasonaim = state
        if game.Players.LocalPlayer.Character.Name ~= "Jason" and state then
            Rayfield:Notify{Title = "报错", Text = "你现在的角色不是杰森!", Duration = 5}
            return 
        end
            if state then
                jasonaimbotloop = game.Players.LocalPlayer.Character.HumanoidRootPart.ChildAdded:Connect(function(child)
                    if not jasonaim then return end
                    for _, v in pairs(jasonaimbotsounds) do
                        if child.Name == v then

                            local survivors = {}
                            for _, player in pairs(game.Players:GetPlayers()) do
                                if player ~= game.Players.LocalPlayer then
                                    local character = player.Character
                                    if character and character:FindFirstChild("HumanoidRootPart") then
                                        table.insert(survivors, character)
                                    end
                                end
                            end


                            local nearestSurvivor = nil
                            local shortestDistance = math.huge  

                            for _, survivor in pairs(survivors) do
                                local survivorHRP = survivor.HumanoidRootPart
                                local playerHRP = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

                                if playerHRP then
                                    local distance = (survivorHRP.Position - playerHRP.Position).Magnitude
                                    if distance < shortestDistance then
                                        shortestDistance = distance
                                        nearestSurvivor = survivor
                                    end
                                end
                            end


                            if nearestSurvivor then
                                local nearestHRP = nearestSurvivor.HumanoidRootPart
                                local playerHRP = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                                local maxIterations = 70
                                if playerHRP then
                                    local direction = (nearestHRP.Position - playerHRP.Position).Unit
                                    local num = 1


                                        while num <= maxIterations do
                                            task.wait(0.01)
                                            num = num + 1

                                            playerHRP.CFrame = CFrame.lookAt(playerHRP.Position, Vector3.new(nearestHRP.Position.X, nearestHRP.Position.Y, nearestHRP.Position.Z))

                                    end
                                end
                            end
                        end
                    end
                end)
            else
                if jasonaimbotloop then
                    jasonaimbotloop:Disconnect()
                    jasonaimbotloop = nil
                end
            end
    end

    local function flip() -- bro ivan if you see this mine started SPINNING LIKE A DOLPHIN I CANT BRO IM SORRY BUT I WANTED TO USE THIS WHEN I WAS USING MY UI LOLLL 
        local char = player.Character
        local hum = char.Humanoid
        local animator = hum.Animator
        local hrp = char.HumanoidRootPart


        if animator then
            for _, v in pairs(animator:GetPlayingAnimationTracks()) do
                v:Stop()
            end
        end

        hum:ChangeState(Enum.HumanoidStateType.Physics)
            hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
            hum:SetStateEnabled(Enum.HumanoidStateType.Freefall, false)
            hum:SetStateEnabled(Enum.HumanoidStateType.Running, false)
            hum:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
            hum:SetStateEnabled(Enum.HumanoidStateType.Climbing, false)

            local duration = 0.45
            local steps = 120
            local startCFrame = hrp.CFrame
            local forwardVector = startCFrame.LookVector
            local upVector = Vector3.new(0, 1, 0)
            task.spawn(function()
                local startTime = tick()
                for i = 1, steps do
                    local t = i / steps
                    local height = 4 * (t - t ^ 2) * 10
                    local nextPos = startCFrame.Position + forwardVector * (35 * t) + upVector * height
                    local rotation = startCFrame.Rotation * CFrame.Angles(-math.rad(i * (360 / steps)), 0, 0)

                    hrp.CFrame = CFrame.new(nextPos) * rotation
                    local elapsedTime = tick() - startTime
                    local expectedTime = (duration / steps) * i
                    local waitTime = expectedTime - elapsedTime
                    if waitTime > 0 then
                        task.wait(waitTime)
                    end
                end

                hrp.CFrame = CFrame.new(startCFrame.Position + forwardVector * 35) * startCFrame.Rotation
                hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
                hum:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
                hum:SetStateEnabled(Enum.HumanoidStateType.Running, true)
                hum:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
                hum:SetStateEnabled(Enum.HumanoidStateType.Climbing, true)
                hum:ChangeState(Enum.HumanoidStateType.Running)


            end)


    end

    local function staminadrainono(state)
        stam = state
        local stamscript = require(game.ReplicatedStorage.Systems.Character.Game.Sprinting)

        local connection
        connection = game:GetService("RunService").Heartbeat:Connect(function()
            if not stam then
                connection:Disconnect()
                stamscript.StaminaLossDisabled = nil
                return
            end
            stamscript.StaminaLossDisabled = function() 
            end
        end)

    end

    local function unlockclientcharacters()
        local clone = game.Players.LocalPlayer.PlayerData.Equipped.Skins:Clone()
        clone.Parent = game.Players.LocalPlayer.PlayerData.Purchased.Killers
        for i, v in pairs(clone:GetChildren()) do
            v.Parent = game.Players.LocalPlayer.PlayerData.Purchased.Killers
            end
        local clone2 = game.Players.LocalPlayer.PlayerData.Equipped.Skins:Clone()
        clone2.Parent = game.Players.LocalPlayer.PlayerData.Purchased.Survivors

            for i, v in pairs(clone2:GetChildren()) do
            v.Parent = game.Players.LocalPlayer.PlayerData.Purchased.Survivors
            end
    end

    Rayfield:Notify{Title = "欢迎使用 CHANGED 被遗弃", Duration = 10, Image = 14799621448,}
    Rayfield:Notify{Title = "这是福瑞脚本吗???没有.不是!", Duration = 10, Image = 94177721628694,}

local function CreateEsp(Char,Color,Text,Parent)
if Char then
local NewHighlight = Instance.new("Highlight",Char)
NewHighlight.OutlineColor = Color NewHighlight.FillColor = Color
end
end

local function KeepEsp(Char)
if Char and Char:FindFirstChildOfClass("Highlight") then
Char:FindFirstChildOfClass("Highlight"):Destroy()
end
end

local EspSurvivorsToggle = EspTab:CreateToggle({
   Name = "绘制幸存者(绿色)",
   CurrentValue = false,
   Flag = "EspSurvivors",
   Callback = function(Value)
  ActiveEspSurvivors = Value task.spawn(function()
while ActiveEspSurvivors do task.spawn(function()
for _,Players in pairs(Game.Workspace.Players.Survivors:GetChildren()) do 
if Players:isA("Model") and not Players:FindFirstChildOfClass("Highlight") then
CreateEsp(Players,Color3.fromRGB(0,255,0))
end
end
end)
task.wait(0.1)
end for _,Players in pairs(Game.Workspace.Players.Survivors:GetChildren()) do 
if Players:isA("Model") and Players:FindFirstChildOfClass("Highlight") then
KeepEsp(Players)
end
end 
 end)
end,
})

local EspKillersToggle = EspTab:CreateToggle({
   Name = "绘制杀手(红色)",
   CurrentValue = false,
   Flag = "EspKiller", 
   Callback = function(Value)
  ActiveEspKillers = Value task.spawn(function()
while ActiveEspKillers do task.spawn(function()
for _,Players in pairs(Game.Workspace.Players.Killers:GetChildren()) do 
if Players:isA("Model") and not Players:FindFirstChildOfClass("Highlight") then
CreateEsp(Players,Color3.fromRGB(255,0,0))
end
end
end)
task.wait(0.1)
end for _,Players in pairs(Game.Workspace.Players.Killers:GetChildren()) do 
if Players:isA("Model") and Players:FindFirstChildOfClass("Highlight") then
KeepEsp(Players)
end
end 
 end)
end,
}) local EspGeneratorToggle = EspTab:CreateToggle({
   Name = "绘制发电机(黄色)",
   CurrentValue = false,
   Flag = "EspGenerator", 
   Callback = function(Value)
  ActiveEspGenerator= Value task.spawn(function()
while ActiveEspGenerator do
if Game.Workspace.Map.Ingame:FindFirstChild("Map") then
for _,Players in pairs(Game.Workspace.Map.Ingame:FindFirstChild("Map"):GetChildren()) do 
if Players:isA("Model") and Players.name == "Generator" and not Players:FindFirstChildOfClass("Highlight") then
CreateEsp(Players,Color3.fromRGB(255,255,0))
end
end
end
task.wait(0.1) 
end
if Game.Workspace.Map.Ingame:FindFirstChild("Map") then
for _,Players in pairs(Game.Workspace.Map.Ingame:FindFirstChild("Map"):GetChildren()) do 
if Players:isA("Model") and Players.name == "Generator" and not Players:FindFirstChildOfClass("Highlight") then
KeepEsp(Players) end
end
end
 end)
end,
})
local EspItemsToggle = EspTab:CreateToggle({
   Name = "绘制物品(蓝色)",
   CurrentValue = false,
   Flag = "EspItems", 
   Callback = function(Value)
  ActiveEspItems= Value task.spawn(function()
while ActiveEspItems do
for _,Players in pairs(Game.Workspace.Map.Ingame:GetChildren()) do 
if Players:isA("Tool")  and not Players:FindFirstChildOfClass("Highlight") then
CreateEsp(Players,Color3.fromRGB(0,0,255))
end
end
task.wait(0.1) end
for _,Players in pairs(Game.Workspace.Map.Ingame:GetChildren()) do 
if Players:isA("Tool")  and not Players:FindFirstChildOfClass("Highlight") then
KeepEsp(Players) end
end
 end)
end,
})
local EspRagdollsToggle = EspTab:CreateToggle({
   Name = "绘制尸体和召唤傀儡(1×1×1×1)和奴才(c00lkidd)",
   CurrentValue = false,
   Flag = "EspRagdolls", 
   Callback = function(Value)
  ActiveEspRagdolls = Value task.spawn(function()
while ActiveEspRagdolls do task.spawn(function()
for _,Players in pairs(Game.Workspace.Ragdolls:GetChildren()) do 
if Players:isA("Model") and not Players:FindFirstChildOfClass("Highlight") then
CreateEsp(Players,Color3.fromRGB(47,47,47))
end
end
end)
task.wait(0.1)
end for _,Players in pairs(Game.Workspace.Ragdolls:GetChildren()) do 
if Players:isA("Model") and Players:FindFirstChildOfClass("Highlight") then
KeepEsp(Players)
end
end 
 end)
end,
})
     local Toggle2 = EspTab:CreateToggle({
        Name = "发电机高亮",
        CurrentValue = false,
        Callback = function(state)
        toggleHighlightGen(state)
        end,
     })


EspTab:CreateDivider() 

local Button = EspTab:CreateButton({
   Name = "绘制发电机和杀手",
   Callback = function()
-- All Player Highlight ESP Script (Bug-Fixed)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local workspace = game:GetService("Workspace")

-- Wait for the Map to exist before continuing
repeat wait() until workspace:FindFirstChild("Map")

-- Table to track highlighted models
local highlighted = {}

-- Function to add a Highlight instance to a model
local function highlight(model, tag, color)
    if not model:FindFirstChild("HighlightESP") then
        local highlight = Instance.new("Highlight")
        highlight.Name = "HighlightESP"
        highlight.FillColor = color
        highlight.FillTransparency = 0.5
        highlight.OutlineColor = Color3.new(0, 0, 0)
        highlight.OutlineTransparency = 0.1
        highlight.Adornee = model
        highlight.Parent = model
    end
end

-- Handler function for all objects
local function handle(obj)
    if highlighted[obj] then return end
    if not obj:IsA("Model") then return end

    -- Must have at least one BasePart to be highlighted
    local part = obj:FindFirstChildWhichIsA("BasePart")
    if not part then return end

    -- Check if it's a Killer first (priority)
    if obj.Parent and obj.Parent.Name == "Killers" then
        highlight(obj, "Killer", Color3.fromRGB(255, 0, 0)) -- Red
        highlighted[obj] = true
        return
    end

    -- Check if it's a player character (not the local player)
    local isPlayerChar = Players:GetPlayerFromCharacter(obj)
    if isPlayerChar and obj ~= LocalPlayer.Character then
        highlight(obj, "Player", Color3.fromRGB(0, 255, 0)) -- Green
        highlighted[obj] = true
    end
end

-- Run for existing objects
for _, obj in ipairs(workspace:GetDescendants()) do
    handle(obj)
end

-- Handle new objects
workspace.DescendantAdded:Connect(handle)
end,
})

local Button = EspTab:CreateButton({
   Name = "绘制物品",
   Callback = function()
local ws = cloneref(game:GetService("Workspace"))

local function addLabel(tool)
    if string.lower(tool.Name):find("flag") then return end

    local parentPart = tool:FindFirstChild("Handle") or tool:FindFirstChildWhichIsA("BasePart")
    if not parentPart then return end -- If no valid part is found, exit

    local bb = Instance.new("BillboardGui")
    bb.Name = "ToolLabel"
    bb.Size = UDim2.new(0, 150, 0, 30) -- Smaller size
    bb.StudsOffset = Vector3.new(0, 2, 0)
    bb.AlwaysOnTop = true
    bb.MaxDistance = math.huge -- Always visible
    bb.LightInfluence = 0 -- Keeps brightness consistent
    bb.Parent = parentPart

    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, 0, 1, 0)
    lbl.BackgroundTransparency = 1
    lbl.TextScaled = true
    lbl.Font = Enum.Font.SourceSansBold
    lbl.TextColor3 = Color3.new(0, 255, 255)
    lbl.TextStrokeTransparency = 0
    lbl.TextTransparency = 0.5 -- Slightly transparent text
    lbl.Text = tool.Name
    lbl.Parent = bb
end

for _, tool in ipairs(ws:GetDescendants()) do
    if tool:IsA("Tool") then addLabel(tool) end
end

ws.DescendantAdded:Connect(function(tool)
    if tool:IsA("Tool") then 
        task.wait(0.1) 
        addLabel(tool) 
    end
end)

ws.DescendantRemoving:Connect(function(tool)
    local parentPart = tool:FindFirstChild("Handle") or tool:FindFirstChildWhichIsA("BasePart")
    if parentPart then
        local lbl = parentPart:FindFirstChild("ToolLabel")
        if lbl then lbl:Destroy() end
    end
end)
end,
})
local Button = EspTab:CreateButton({
   Name = "绘制幸存者",
   Callback = function()
local cref = cloneref or function(ref) return ref end
local ts = cref(game:GetService("TweenService"))
local ws = cref(workspace)

local gens, hl = {}, {}

local function getColors(p)
    local progress = math.clamp(p / 100, 0, 1)
    
    -- Color transition logic:
    local fillColor
    if progress < 1 then
        fillColor = Color3.new(1, progress, 0) -- Red (1,0,0) to Yellow (1,1,0)
    else
        fillColor = Color3.new(0, 1, 0) -- Green (0,1,0) at 100%
    end
    
    local outlineColor = fillColor:Lerp(Color3.new(0, 0, 0), 0.3) -- Slightly darker outline

    return fillColor, outlineColor
end

local function updateHL(gen)
    local prog, h = gen:FindFirstChild("Progress"), hl[gen]
    if prog and h then
        local f, o = getColors(prog.Value)
        local speed = math.clamp(1 - (prog.Value / 100), 0.2, 0.5)
        
        local tf = ts:Create(h, TweenInfo.new(speed, Enum.EasingStyle.Linear), {FillColor = f})
        local to = ts:Create(h, TweenInfo.new(speed, Enum.EasingStyle.Linear), {OutlineColor = o})
        tf:Play()
        to:Play()
        
        tf.Completed:Connect(function()
            tf:Destroy()
            to:Destroy()
        end)
    end
end

local function monitorProgress(gen)
    local prog = gen:FindFirstChild("Progress")
    if not prog then return end

    -- Constantly check for changes every 0.1 seconds
    task.spawn(function()
        while gens[gen] and prog do
            updateHL(gen)
            task.wait(0.1) -- Fast detection
        end
    end)
end

local function addGen(obj)
    if obj:IsA("Model") and obj.Name == "Generator" and not gens[obj] then
        gens[obj] = true
        local h = Instance.new("Highlight", obj)
        h.Adornee, hl[obj] = obj, h
        local f, o = getColors(1)
        h.FillColor, h.OutlineColor = f, o
        local prog = obj:FindFirstChild("Progress")
        if prog and prog:IsA("NumberValue") then
            monitorProgress(obj) -- Start the manual detection loop
            updateHL(obj)
        end
    end
end

local function removeGen(obj)
    if gens[obj] then
        gens[obj] = nil
        if hl[obj] then hl[obj]:Destroy() hl[obj] = nil end
    end
end

local function validateGenerators()
    local m = ws:FindFirstChild("Map")
    local gm = m and m:FindFirstChild("Ingame") and m.Ingame:FindFirstChild("Map")
    
    if gm then
        -- Add missing generators
        for _, obj in ipairs(gm:GetChildren()) do
            if obj:IsA("Model") and obj.Name == "Generator" and not gens[obj] then
                addGen(obj)
            end
        end
        
        -- Remove invalid generators
        for obj in pairs(gens) do
            if not obj or not obj.Parent or obj.Parent ~= gm then
                removeGen(obj)
            end
        end
    end
end

-- Loop to continuously check for new or missing generators
task.spawn(function()
    while true do
        validateGenerators()
        task.wait(1) -- Check every 1 second
    end
end)
end,
})
local Button = EspTab:CreateButton({
   Name = "绘制盒子",
   Callback = function()
local Settings = {
    Box_Color = Color3.fromRGB(128, 0, 128),
    Box_Thickness = 2,
    Team_Check = false,
    Team_Color = false,
    Autothickness = true
}

local Space = game:GetService("Workspace")
local Player = game:GetService("Players").LocalPlayer
local Camera = Space.CurrentCamera

local function NewLine(color, thickness)
    local line = Drawing.new("Line")
    line.Visible = false
    line.From = Vector2.new(0, 0)
    line.To = Vector2.new(0, 0)
    line.Color = color
    line.Thickness = thickness
    line.Transparency = 1
    return line
end

local function Vis(lib, state)
    for i, v in pairs(lib) do
        v.Visible = state
    end
end

local function Colorize(lib, color)
    for i, v in pairs(lib) do
        v.Color = color
    end
end

local Black = Color3.fromRGB(0, 0, 0)

local function Rainbow(lib, delay)
    for hue = 0, 1, 1/30 do
        local color = Color3.fromHSV(hue, 0.6, 1)
        Colorize(lib, color)
        wait(delay)
    end
    Rainbow(lib)
end

local function Main(plr)
    repeat wait() until plr.Character ~= nil and plr.Character:FindFirstChild("Humanoid") ~= nil
    local R15
    if plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
        R15 = true
    else 
        R15 = false
    end
    local Library = {
        TL1 = NewLine(Settings.Box_Color, Settings.Box_Thickness),
        TL2 = NewLine(Settings.Box_Color, Settings.Box_Thickness),

        TR1 = NewLine(Settings.Box_Color, Settings.Box_Thickness),
        TR2 = NewLine(Settings.Box_Color, Settings.Box_Thickness),

        BL1 = NewLine(Settings.Box_Color, Settings.Box_Thickness),
        BL2 = NewLine(Settings.Box_Color, Settings.Box_Thickness),

        BR1 = NewLine(Settings.Box_Color, Settings.Box_Thickness),
        BR2 = NewLine(Settings.Box_Color, Settings.Box_Thickness)
    }
    local oripart = Instance.new("Part")
    oripart.Parent = Space
    oripart.Transparency = 1
    oripart.CanCollide = false
    oripart.Size = Vector3.new(1, 1, 1)
    oripart.Position = Vector3.new(0, 0, 0)
    local function Updater()
        local c 
        c = game:GetService("RunService").RenderStepped:Connect(function()
            if plr.Character ~= nil and plr.Character:FindFirstChild("Humanoid") ~= nil and plr.Character:FindFirstChild("HumanoidRootPart") ~= nil and plr.Character.Humanoid.Health > 0 and plr.Character:FindFirstChild("Head") ~= nil then
                local Hum = plr.Character
                local HumPos, vis = Camera:WorldToViewportPoint(Hum.HumanoidRootPart.Position)
                if vis then
                    oripart.Size = Vector3.new(Hum.HumanoidRootPart.Size.X, Hum.HumanoidRootPart.Size.Y*1.5, Hum.HumanoidRootPart.Size.Z)
                    oripart.CFrame = CFrame.new(Hum.HumanoidRootPart.CFrame.Position, Camera.CFrame.Position)
                    local SizeX = oripart.Size.X
                    local SizeY = oripart.Size.Y
                    local TL = Camera:WorldToViewportPoint((oripart.CFrame * CFrame.new(SizeX, SizeY, 0)).p)
                    local TR = Camera:WorldToViewportPoint((oripart.CFrame * CFrame.new(-SizeX, SizeY, 0)).p)
                    local BL = Camera:WorldToViewportPoint((oripart.CFrame * CFrame.new(SizeX, -SizeY, 0)).p)
                    local BR = Camera:WorldToViewportPoint((oripart.CFrame * CFrame.new(-SizeX, -SizeY, 0)).p)

                    if Settings.Team_Check then
                        if plr.TeamColor == Player.TeamColor then
                            Colorize(Library, Color3.fromRGB(0, 255, 0))
                        else 
                            Colorize(Library, Color3.fromRGB(255, 0, 0))
                        end
                    end

                    if Settings.Team_Color then
                        Colorize(Library, plr.TeamColor.Color)
                    end

                    local ratio = (Camera.CFrame.p - Hum.HumanoidRootPart.Position).magnitude
                    local offset = math.clamp(1/ratio*750, 2, 300)

                    Library.TL1.From = Vector2.new(TL.X, TL.Y)
                    Library.TL1.To = Vector2.new(TL.X + offset, TL.Y)
                    Library.TL2.From = Vector2.new(TL.X, TL.Y)
                    Library.TL2.To = Vector2.new(TL.X, TL.Y + offset)

                    Library.TR1.From = Vector2.new(TR.X, TR.Y)
                    Library.TR1.To = Vector2.new(TR.X - offset, TR.Y)
                    Library.TR2.From = Vector2.new(TR.X, TR.Y)
                    Library.TR2.To = Vector2.new(TR.X, TR.Y + offset)

                    Library.BL1.From = Vector2.new(BL.X, BL.Y)
                    Library.BL1.To = Vector2.new(BL.X + offset, BL.Y)
                    Library.BL2.From = Vector2.new(BL.X, BL.Y)
                    Library.BL2.To = Vector2.new(BL.X, BL.Y - offset)

                    Library.BR1.From = Vector2.new(BR.X, BR.Y)
                    Library.BR1.To = Vector2.new(BR.X - offset, BR.Y)
                    Library.BR2.From = Vector2.new(BR.X, BR.Y)
                    Library.BR2.To = Vector2.new(BR.X, BR.Y - offset)

                    Vis(Library, true)

                    if Settings.Autothickness then
                        local distance = (Player.Character.HumanoidRootPart.Position - oripart.Position).magnitude
                        local value = math.clamp(1/distance*100, 1, 4)
                        for u, x in pairs(Library) do
                            x.Thickness = value
                        end
                    else 
                        for u, x in pairs(Library) do
                            x.Thickness = Settings.Box_Thickness
                        end
                    end
                else 
                    Vis(Library, false)
                end
            else 
                Vis(Library, false)
                if game:GetService("Players"):FindFirstChild(plr.Name) == nil then
                    for i, v in pairs(Library) do
                        v:Remove()
                        oripart:Destroy()
                    end
                    c:Disconnect()
                end
            end
        end)
    end
    coroutine.wrap(Updater)()
end

for i, v in pairs(game:GetService("Players"):GetPlayers()) do
    if v.Name ~= Player.Name then
        coroutine.wrap(Main)(v)
    end
end

game:GetService("Players").PlayerAdded:Connect(function(newplr)
    coroutine.wrap(Main)(newplr)
end)
end ,
})
local Button = EspTab:CreateButton({
   Name = "显示距离",
   Callback = function()
local Skids = game:GetService("Players")
local RenderTrash = game:GetService("RunService")
local Me = Skids.LocalPlayer
local Cam = workspace.CurrentCamera
local ToeTextFarm = {}

-- ☠️ Create distance label at someone's feet
local function ToeDistance(victim)
	if victim == Me then return end
	if ToeTextFarm[victim] then return end

	local text = Drawing.new("Text")
	text.Size = 18
	text.Center = true
	text.Outline = true
	text.Color = Color3.fromRGB(255, 255, 255)
	text.Transparency = 1 -- FULLY VISIBLE
	text.Visible = true

	ToeTextFarm[victim] = text

	victim.CharacterAdded:Connect(function()
		wait(1)
		text.Visible = true
	end)
end

-- ❌ Remove text if player leaves
local function DeleteToe(victim)
	if ToeTextFarm[victim] then
		ToeTextFarm[victim]:Remove()
		ToeTextFarm[victim] = nil
	end
end

-- Register all players
for _, skid in pairs(Skids:GetPlayers()) do
	ToeDistance(skid)
end

Skids.PlayerAdded:Connect(ToeDistance)
Skids.PlayerRemoving:Connect(DeleteToe)

-- 🔁 Render ESP every frame
RenderTrash.RenderStepped:Connect(function()
	for skid, txt in pairs(ToeTextFarm) do
		local char = skid.Character
		local hrp = char and char:FindFirstChild("HumanoidRootPart")
		local myhrp = Me.Character and Me.Character:FindFirstChild("HumanoidRootPart")

		if hrp and myhrp then
			local dist = math.floor((hrp.Position - myhrp.Position).Magnitude)
			local pos, onScreen = Cam:WorldToViewportPoint(hrp.Position - Vector3.new(0, 2.5, 0)) -- Down to the feet/toes
			if onScreen then
				txt.Visible = true
				txt.Position = Vector2.new(pos.X, pos.Y)
				txt.Text = "[" .. dist .. "m]"
			else
				txt.Visible = false
			end
		else
			txt.Visible = false
		end
	end
end)

end,
})

EspTab:CreateDivider() 

    local Toggle3 = EspTab:CreateToggle({
        Name = "工具高亮",
        CurrentValue = false,

        Callback = function(state)
        highlighttools(state)
        end,
     })

     local Toggle4 = EspTab:CreateToggle({
        Name = "幸存者高亮",
        CurrentValue = false,

        Callback = function(state)
        survivorHighlighter(state)
        end,
     })

     local Toggle5 = EspTab:CreateToggle({
        Name = "杀手高亮",
        CurrentValue = false,

        Callback = function(state)
        killerHighlighter(state)
        end,
     })

     local Toggle6 = EspTab:CreateToggle({
        Name = "绘制 C00lkidd",
        CurrentValue = false,

        Callback = function(state)
        corruptnatureesp(state)
        end,
     })

     local Toggle7 = EspTab:CreateToggle({
        Name = "幸存者建造的东西高亮",
        CurrentValue = false,

        Callback = function(state)
        survivorutilesp(state)
        end,
     })
     
    local WalkspeedSlider = PlayerTab:CreateSlider({
        Name = "行走速度",
        Range = {1, 1000},
        Increment = 1,
        Suffix = ";",
        CurrentValue = 1,
        Callback = function(value)
        speedmulti(value)
        end,
     })

     local JumpspeedSlider = PlayerTab:CreateSlider({
        Name = "跳跃高度",
        Range = {1, 1000},
        Increment = 1,
        Suffix = ";",
        CurrentValue = 50,
        Callback = function(value)
        bringbackjumppowerslider(value)
        end,
     })
end

local ValueSpeed = 16
local PlayerSpeedSlider = PlayerTab:CreateSlider({
   Name = "玩家速度(太高容易封)",
   Range = {0, 25},
   Increment = 1,
   Suffix = "Speeds",
   CurrentValue = 16,
   Flag = "Slider1", 
   Callback = function(Value)
CurrentValue = Value
ValueSpeed = Value
end,  ValueSpeed = CurrentValue,
})

local PlayerActiveModifyingSpeedToggle = PlayerTab:CreateToggle({
   Name = "⬆️ 确定修改",
   CurrentValue = false,
   Flag = "ButtonSpeed", 
   Callback = function(Value)
  ActiveSpeedBoost = Value 
task.spawn(function()
while ActiveSpeedBoost do 
task.spawn(function()
Game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = ValueSpeed 
Game.Players.LocalPlayer.Character.Humanoid:SetAttribute("BaseSpeed",ValueSpeed)
end)
task.wait(0.1)
end end)
end,
}) local function copyToClipboard(text)
    if setclipboard then
        setclipboard(text)
    else
        warn("setclipboard is not supported in this environment.")
    end
end

local PlayerActiveAutoGeneratorToggle = PlayerTab:CreateToggle({
   Name = "自动修电机(每次一坤秒)",
   CurrentValue = false,
   Flag = "ButtonAutoGen", 
   Callback = function(Value)
  ActiveAutoGenerator = Value task.spawn(function()
while ActiveAutoGenerator do task.spawn(function()
for _,Players in pairs(Game.Workspace.Map.Ingame:FindFirstChild("Map"):GetChildren()) do 
if Players:isA("Model") and Players.name == "Generator"  then if Players:FindFirstChild("Remotes"):FindFirstChild("RE") then Players:FindFirstChild("Remotes"):FindFirstChild("RE"):FireServer() end
 end
end end)
task.wait(2.5)
end end)
end,
}) 

local PlayerNoStunToggle = PlayerTab:CreateToggle({
   Name = "不会被击晕",
   CurrentValue = false,
   Flag = "NoStunButton",
   Callback = function(Value)
  ActiveNoStun = Value task.spawn(function()
while ActiveNoStun do task.spawn(function()
Game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
end)
task.wait(0.001)
end end)
end,
})
local PlayerAutoUseCoinFlipToggle = PlayerTab:CreateToggle({
   Name = "自动翻金币(机会专用)",
   CurrentValue = false,
   Flag = "AutoUseCoinFlipbutton", 
   Callback = function(Value)
  ActiveAutoUseCoinFlip = Value task.spawn(function()
while ActiveAutoUseCoinFlip do task.spawn(function()

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RemoteEvent = ReplicatedStorage.Modules.Network.RemoteEvent -- RemoteEvent 

RemoteEvent:FireServer(
    "UseActorAbility",
    "CoinFlip"
)

end)
task.wait(1)
end end)
end,
})

local PlayerActiveAutoKillSurvivorsToggle = PlayerTab:CreateToggle({
   Name = "自动杀幸存者(小心家里的两位😏)",
   CurrentValue = false,
   Flag = "ButtonAutoKillSurvivors", 
   Callback = function(Value)
  ActiveAutoKillSurvivors = Value task.spawn(function()
while ActiveAutoKillSurvivors do 
task.spawn(function()
for _,Players in pairs(Game.Workspace.Players.Survivors:GetChildren()) do 
if Players:isA("Model") then
Game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = Players.HumanoidRootPart.CFrame
task.spawn(function()
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local RemoteEvent = ReplicatedStorage.Modules.Network.RemoteEvent -- RemoteEvent 

RemoteEvent:FireServer(
    "UseActorAbility",
    "Slash"
)

wait(2.5)
end)
end
end
end)
task.wait(0.1)
end end)
end,
})
    local jump = PlayerTab:CreateToggle({ 
        Name = "获得跳跃键",
        CurrentValue = false,
        Callback = function(state)
            bringbackjumppower(state)
        end,
    })

    local hawktuah = PlayerTab:CreateToggle({ 
        Name = "马克涂鸦模式",
        CurrentValue = false,
        Callback = function(state)
            hawktuahmode(state)
        end,
    })
 local Choosed = "nothings"
local DropdownTpGen = PlayerTab:CreateDropdown({
   Name = "选择传送地点",
   Options = {},
   CurrentOption = {"Nothings"},
   MultipleOptions = false,
   Flag = nil,
   Callback = function(Options)   task.spawn(function()
for _,Players in pairs(Game.Workspace.Map.Ingame:FindFirstChild("Map"):GetChildren()) do 
if Players:isA("Model") and Players.name == "Generator"  then 
if Players:FindFirstChild("GeneratorTP") then 
if Players:FindFirstChild("GeneratorTP").Value == DropdownTpGen.CurrentOption then 
Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Players.PrimaryPart.CFrame 
end  end 
 end
end  end)
   end,
})
local PlayerRefreshGenButton = PlayerTab:CreateButton({
   Name = "⬆️ 刷新一次",
   Callback = function(Value) local num = 1
task.spawn(function() local GenTable = {} for _,Players in pairs(Game.Workspace.Map.Ingame:FindFirstChild("Map"):GetChildren()) do 
if Players:isA("Model") and Players.name == "Generator"  then table.insert(GenTable,"Generator ".. num) if not  Players:FindFirstChild("GeneratorTP") then task.spawn(function() local NewValue = Instance.new("StringValue",Players) NewValue.Name = "GeneratorTP" NewValue.Value = "Generator "..num end) end num = num +1
 end
end 
    DropdownTpGen:Refresh(GenTable)
end)
end,
})

PlayerTab:CreateDivider() 

local PlayerActiveInfStaminaToggle = ATab:CreateToggle({
   Name = "无限体力(Beta)",
   CurrentValue = false,
   Flag = "ButtonInfiniteStamina", 
   Callback = function(Value)
  ActiveInfiniteStamina = Value task.spawn(function()
while ActiveInfiniteStamina do task.spawn(function()
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UnreliableRemoteEvent = ReplicatedStorage.Modules.Network.UnreliableRemoteEvent
UnreliableRemoteEvent:FireServer("FootstepPlayed",100)
end)
task.wait(0.00000001)
end end)
end,
})
   local nostaminaloss = ATab:CreateToggle({ 
        Name = "无限体力(正式)",
        CurrentValue = false,
        Callback = function(state)
            staminadrainono(state)
        end,
           })

ATab:CreateDivider() 

local SliderInfiniteStamina = ATab:CreateSlider({
   Name = "体力上限",
   Range = {0, 200},
   Increment = 10,
   Suffix = "Bananas",
   CurrentValue = 10,
   Flag = "SliderInfiniteStamina", 
   Callback = function(Value)
   local Sprinting = game:GetService("ReplicatedStorage").Systems.Character.Game.Sprinting
local stamina = require(Sprinting)
stamina.MaxStamina = Value
stamina.StaminaLossDisabled = true 
   end,
})
--[[
local SliderGainStamina = ATab:CreateSlider({
   Name = "体力回复速度",
   Range = {5, 100},
   Increment = 5,
   Suffix = "Bananas",
   CurrentValue = 5,
   Flag = "SliderGainStamina",
   Callback = function(Value)
      local Sprinting = game:GetService("ReplicatedStorage").Systems.Character.Game.Sprinting
local stamina = require(Sprinting)
stamina.StaminaGain = Value
stamina.StaminaLossDisabled = true 
   end,
})
]]
    local InstantSolveButton = gentab:CreateButton({
        Name = "秒完成电机",
        Callback = function()
        instantsolvegen()
        end,
     })

     local InstantSolveButtonGenHell = gentab:CreateButton({
        Name = "Gen Hell 2 地图秒解电机",
        Callback = function()
        instantsolvegenhell()
        end,
     })


     local OnePuzzle = gentab:CreateButton({
        Name = "一个解密按钮",
        Callback = function()
        solvegen()
        end,
     })


     gentab:CreateDivider() 



     local Toggle1 = gentab:CreateToggle({
        Name = "自动修电机",
        CurrentValue = false,

        Callback = function(state)
        autogen(state)
        end,
     })

     gentab:CreateDivider() 

     local Keybind = gentab:CreateKeybind({
        Name = "自动解电机谜题",
        CurrentKeybind = "H",
        HoldToInteract = false,

        Callback = function(Keybind)
        solvegen()
        end,
     })

     local Slider1 = gentab:CreateSlider({
        Name = "延迟",
        Range = {2.5, 10},
        Increment = 0.1,
        Suffix = "seconds",
        CurrentValue = 0.1,

        Callback = function(value)
        setdelay(value)
        end,
     })

local Button = gentab:CreateButton({
   Name = "自动修电机 2",
   Callback = function()
-- Settings
local cooldown = 3.5
local onCooldown = false
local running = true -- You can set this to false to stop the loop manually

-- Function to solve generators
local function solveGenerators()
	if onCooldown then return end
	onCooldown = true

	local success, err = pcall(function()
		local mapFolder = workspace:WaitForChild("Map"):WaitForChild("Ingame"):WaitForChild("Map")
		for _, g in ipairs(mapFolder:GetChildren()) do
			if g.Name == "Generator" and g:FindFirstChild("Remotes") and g.Remotes:FindFirstChild("RE") then
				g.Remotes.RE:FireServer()
			end
		end
	end)

	if not success then
		warn("Failed to solve generator:", err)
	end

	task.wait(cooldown)
	onCooldown = false
end

-- Continuous loop
while running do
	solveGenerators()
	task.wait(0.1) -- small wait to prevent script overload
end
   end,
})
local Button = gentab:CreateButton({
   Name = "显示修发电机机按钮",
   Callback = function()
 -- Create ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "GeneratorGUI"
gui.ResetOnSpawn = false
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create main frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 250, 0, 100)
frame.Position = UDim2.new(0.4, 0, 0.4, 0)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.Active = true
frame.Draggable = true
frame.Parent = gui

-- Create button
local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 200, 0, 50)
button.Position = UDim2.new(0.1, 0, 0.25, 0)
button.Text = "修发电机"
button.TextScaled = true
button.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Font = Enum.Font.Arcade
button.Parent = frame

-- Cooldown settings
local cooldown = 1.5
local onCooldown = false

-- Button click action
button.MouseButton1Click:Connect(function()
if onCooldown then return end
onCooldown = true

-- Run the generator-solving code  
local ingameFolder = workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("Ingame")  
local mapFolder = ingameFolder and ingameFolder:FindFirstChild("Map")  
if mapFolder then  
	for _, g in ipairs(mapFolder:GetChildren()) do  
		if g.Name == "Generator" then  
			g.Remotes.RE:FireServer()  
		end  
	end  
end  

-- Start cooldown  
for i = cooldown, 0, -0.1 do  
	button.Text = "延迟: " .. string.format("%.1f", i)  
	wait(0.1)  
end  

-- Reset button text  
button.Text = "修发电机"  
onCooldown = false
end)
   end,
})
     
     local ButtonUnloadCheat = MTab:CreateButton({
   Name = "变态Ellito 要原皮才可以(看得见七八 披萨时撸管 啥也不穿)",
   Callback = function()
--make naked elliot
local elliotshirt = game.workspace.Players.Survivors.Elliot.Shirt
if elliotshirt then
    elliotshirt:Destroy()
else
    print("no shirt roblox")
end

local elliotpants = game.workspace.Players.Survivors.Elliot.Pants
if elliotpants then
    elliotpants:Destroy()
else
    print("no pants elliot roblox")
end

local elliotcolor = workspace.Players.Survivors.Elliot["Body Colors"]

elliotcolor.RightLegColor = BrickColor.new("New Yeller")
elliotcolor.LeftLegColor = BrickColor.new("New Yeller")
elliotcolor.TorsoColor = BrickColor.new("New Yeller")
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local torso = character:FindFirstChild("UpperTorso") or character:FindFirstChild("Torso")

if torso then

    local ball1 = Instance.new("Part")
    ball1.Material = Enum.Material.Glass
    ball1.Size = Vector3.new(0.4, 0.4, 1.5)
    ball1.Shape = Enum.PartType.Ball
    ball1.Anchored = false
    ball1.CanCollide = false
    ball1.Transparency = 0
    ball1.Color = Color3.fromRGB(255, 255, 0)
    ball1.Name = "AttachedBall1"
    ball1.Parent = torso

    local weld1 = Instance.new("Weld")
    weld1.Part0 = torso
    weld1.Part1 = ball1
    weld1.C0 = CFrame.new(0, -0.8, -1.1) * CFrame.Angles(math.rad(30), 0, 0) 
    weld1.Parent = ball1
    ball1.CFrame = torso.CFrame * weld1.C0

    local ball2 = Instance.new("Part")
    ball2.Material = Enum.Material.Glass
    ball2.Size = Vector3.new(0.5, 0.5, 0.5)
    ball2.Shape = Enum.PartType.Ball
    ball2.Anchored = false
    ball2.CanCollide = false
    ball2.Transparency = 0
    ball2.Color = Color3.fromRGB(255, 0, 181) 
    ball2.Name = "AttachedBall2"
    ball2.Parent = torso

    local weld2 = Instance.new("Weld")
    weld2.Part0 = torso
    weld2.Part1 = ball2
    weld2.C0 = CFrame.new(0, -0.5, -1.6) * CFrame.Angles(math.rad(30), 0, 0) 
    weld2.Parent = ball2
    ball2.CFrame = torso.CFrame * weld2.C0

    print("Attached 2 balls to torso!")
else
    warn("Torso not found!")
end

local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer

local function getCharacter()
    return player.Character or player.CharacterAdded:Wait()
end

local function isR15(character)
    local humanoid = character:FindFirstChildWhichIsA("Humanoid")
    return humanoid and humanoid.RigType == Enum.HumanoidRigType.R15
end

local isPlaying = false
local track = nil

local function playAnimationLoop()
    if isPlaying then return end 
    isPlaying = true

    local character = getCharacter()
    local humanoid = character:WaitForChild("Humanoid")

    if track then
        track:Stop()
        track = nil
    end

    local useR15 = isR15(character)

    local anim = Instance.new("Animation")
    anim.AnimationId = not useR15 and "rbxassetid://72042024" or "rbxassetid://698251653"
    track = humanoid:LoadAnimation(anim)

    track.Looped = true
    track:Play()
    track:AdjustSpeed(useR15 and 0.7 or 0.65)
    track.TimePosition = 0.6

    task.wait(1.5)

    if track then
        track:Stop()
        track = nil
    end

    isPlaying = false
end


UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end 
    if input.KeyCode == Enum.KeyCode.Q then
        playAnimationLoop()
    end
end)

local handpizza = workspace.Players.Survivors.Elliot.Pizza
local meshpizzahand = handpizza:FindFirstChild("Mesh")
meshpizzahand:Destroy()
handpizza.Size = Vector3.new(0, 0, 0)

local runLoopValue = Instance.new("BoolValue")
runLoopValue.Name = "RunPizzaLoop"
runLoopValue.Value = false
runLoopValue.Parent = game.Workspace


local function setLoopActive(active)
    runLoopValue.Value = active
end


delay(3, function()
    setLoopActive(true)
end)


local processedPizzas = {}


while true do
    if runLoopValue.Value == true then
        local mapFolder = game.workspace:FindFirstChild("Map")
        if mapFolder then
            local ingameFolder = mapFolder:FindFirstChild("Ingame")
            if ingameFolder then
                for _, pizzaPart in pairs(ingameFolder:GetChildren()) do

                    if pizzaPart.Name == "Pizza" and not processedPizzas[pizzaPart] then
                        processedPizzas[pizzaPart] = true 
                        print("Processing NEW Pizza part:", pizzaPart)


                        local mesh = pizzaPart:FindFirstChild("Mesh")
                        if mesh then
                            mesh:Destroy()
                            print("Destroyed mesh in pizza:", pizzaPart)
                        else
                            print("No mesh found in pizza:", pizzaPart)
                        end


                        pizzaPart.Shape = Enum.PartType.Block


                        local sphereMesh = Instance.new("SpecialMesh")
                        sphereMesh.MeshType = Enum.MeshType.Sphere
                        sphereMesh.Scale = Vector3.new(1, 0.1, 1)  
                        sphereMesh.Parent = pizzaPart



                        pizzaPart.BrickColor = BrickColor.new("Institutional white")
                    end
                end
            end
        end
    end
    wait() 
end
end,
})

local Button = MTab:CreateButton({
   Name = "假格挡",
   Callback = function()
 local sausageHolder = game.CoreGui.TopBarApp.TopBarApp.UnibarLeftFrame.UnibarMenu["2"]
local originalSize = sausageHolder.Size.X.Offset
local sSize = UDim2.new(0, originalSize + 48, 0, sausageHolder.Size.Y.Offset)

local buttonFrame = Instance.new("Frame", sausageHolder)
buttonFrame.Size = UDim2.new(0, 48, 0, 44)
buttonFrame.BackgroundTransparency = 1
buttonFrame.BorderSizePixel = 0
buttonFrame.Position = UDim2.new(0, sausageHolder.Size.X.Offset - 48, 0, 0)

local imageButton = Instance.new("ImageButton", buttonFrame)
imageButton.BackgroundTransparency = 1
imageButton.BorderSizePixel = 0
imageButton.Size = UDim2.new(0, 36, 0, 36)
imageButton.AnchorPoint = Vector2.new(0.5, 0.5)
imageButton.Position = UDim2.new(0.5, 0, 0.5, 0)
imageButton.Image = "http://www.roblox.com/asset/?id=99801122478669"

-- Play animation when clicked
imageButton.Activated:Connect(function()
	local player = game:GetService("Players").LocalPlayer
	local character = player and player.Character
	local humanoid = character and character:FindFirstChildOfClass("Humanoid")

	if humanoid then
		local anim = Instance.new("Animation")
		anim.AnimationId = "rbxassetid://72722244508749"
		local track = humanoid:LoadAnimation(anim)
		track:Play()
	end
end)

while task.wait(0.0000000001) do
	sausageHolder.Size = sSize
	buttonFrame.Position = UDim2.new(0, sausageHolder.Size.X.Offset - 48, 0, 0)
end
  end,
})

     local Toggle8 = MTab:CreateToggle({
        Name = "赌赢了 动作",
        CurrentValue = false,

        Callback = function(state)
        activatethehakari(state)
        end,
     })

     local Toggle9 = MTab:CreateToggle({
        Name = "付费高管",
        CurrentValue = false,

        Callback = function(state)
        activatethesilly(state)
        end,
     })

     local Toggle10 = MTab:CreateToggle({
        Name = "免费高管",
        CurrentValue = false,

        Callback = function(state)
        activatethesilly2(state)
        end,
     })

     local Toggle11 = MTab:CreateToggle({
        Name = "怀念 nink",
        CurrentValue = false,

        Callback = function(state)
        activatethequiet(state)
        end,
     })
       local UnlockChars  = misctab:CreateButton({
        Name = "解锁所有东西",
        Callback = function()
        unlockclientcharacters()
        end,
     })  
       
     misctab:CreateDivider() 

     local Toggle12 = misctab:CreateToggle({
        Name = "隐藏播放栏",
        CurrentValue = false,

        Callback = function(state)
            togglehidebar(state)
        end,
     })

     misctab:CreateDivider() 

local Button = misctab:CreateButton({
   Name = "解锁聊天栏",
   Callback = function()
task.spawn(function()
    while true do
        pcall(function()
            game.TextChatService.ChatWindowConfiguration.Enabled = true
        end)
        task.wait(1)
    end
end)
end,
})

     local Slider2 = misctab:CreateSlider({
        Name = "视角大小",
        Range = {1, 2},
        Increment = 1,
        Suffix = ";",
        CurrentValue = 1,

        Callback = function(value)
        FOVmulti(value)
        end,
     })

     misctab:CreateDivider() 

     local Key = misctab:CreateKeybind({
        Name = "翻转",
        CurrentKeybind = "~",
        HoldToInteract = false,

        Callback = function(Keybind)
        flip()
        end,
     })

    local kaiguy = MTab:CreateButton({
        Name = "kai 1337 皮肤",
        Callback = function()
        kaiguyskin()
        end,
     })

     local doom = MTab:CreateButton({
        Name = "末日侍者皮肤",
        Callback = function()
        doomskin()
        end,
     })


     local Toggle13 = AimTab:CreateToggle({
        Name = "机会 枪自瞄",
        CurrentValue = false,

        Callback = function(state)
            chanceaimbot(state)
        end,
     })

     local Toggle14 = AimTab:CreateToggle({
        Name = "莱茨基自瞄:D",
        CurrentValue = false,

        Callback = function(state)
            shedaimbot(state)
        end,
     })

     local Toggle15 = AimTab:CreateToggle({
        Name = "访客 1337 自瞄",
        CurrentValue = false,

        Callback = function(state)
            guestaimbot(state)
        end,
     })

     local Toggle16 = misctab:CreateToggle({
        Name = "自动传送到披萨",
        CurrentValue = false,
        Callback = function(state)
            givemesomepizza(state)
        end,
     })
    
    local CoolKidAimbotToggle = AimTab:CreateToggle({ 
        Name = "酷小孩 技能自瞄",
        CurrentValue = false,
        Callback = function(state)
            game:GetService("ReplicatedStorage").Modules.Network.RemoteEvent:FireServer("SetDevice", state and "Mobile" or "PC")
        end,
    })


    local aimbot1x1x1aimbot = AimTab:CreateToggle({
        Name = "1x4 自瞄",
        CurrentValue = false,
        Callback = function(state)
           aimbot1x1x1x1(state)
        end,
    })

    local JohnAimbot = AimTab:CreateToggle({ 
        Name = "约翰-多 技能自瞄",
        CurrentValue = false,
        Callback = function(state)
            johnaimbot(state)
        end,
    })

    local JasonAimbot = AimTab:CreateToggle({ 
        Name = "杰森自瞄 (用完要关掉不然会 bug )",
        CurrentValue = false,
        Callback = function(state)
            jasonaimbot(state)
        end,
    })
    
    local DiscordLink = DiscordTab:CreateButton({
   Name = "制作纯缝合",
   Callback = function()
Rayfield:Notify({
   Title = "别搞!",
   Content = "aa",
   Duration = 2.5,
   Image = "rewind",
})
end,
})
local ButtonUnloadCheat = SettingsTab:CreateButton({
   Name = "关闭页面(没事别乱按)",
   Callback = function()
  Rayfield:Destroy()
end,
})
    Rayfield:Notify({
   Title = "加载完成>_<",
   Content = "祝你玩得开心 :D",
   Duration = 6.5,
   Image = 17667616427,
})
    
--[[
local Tab = Window:CreateTab("Local Player", "user")
local Button = Tab:CreateButton({
   Name = "Infinite Stamina",
   Callback = function()
   local rs = cloneref(game:GetService("ReplicatedStorage"))
local sprint = rs.Systems.Character.Game.Sprinting
local m = require(sprint)

m.Stamina = 100

task.spawn(function()
    while task.wait(0.1) do
        if m.Stamina <= 5 then
            m.Stamina = 20
        end
    end
end)
Rayfield:Notify({
   Title = "Notification",
   Content = "The Stamina Will be 20 if ur stamina hit 5",
   Duration = 6.5,
   Image = 4483362458,
})
   end,
})

Rayfield:Notify({
   Title = "✅ | 加载完成",
   Content = "⌛️ | 耗时: " .. tostring(os.time())
   Duration = 4
   Image = "rewind",
})
]]
Rayfield:LoadConfiguration()
initialize()