local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "K.A.T SCRIPT!🔪",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Loading script..",
   LoadingSubtitle = "by union shell hub",
   ShowText = "K.A.T SCRIPT🔪", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "P", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = true, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "union shell hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Hello! Get ur key can get here!",
      Subtitle = "Key System",
      Note = "https://discord.gg/cWQzhYT8", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"UNIONSHELLHUBBEST"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local MainTab = Window:CreateTab("MAIN🏡") -- Title, Image

local Section = MainTab:CreateSection("MAIN🏡")
Rayfield:Notify({
   Title = "executed",
   Content = "thanks for useing",
   Duration = 6.5
})

local Button = MainTab:CreateButton({
   Name = "Aimbot🔫 (XENO AND SOLARA SUPPORTED!)",
   Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ReWelp/ChairHub./refs/heads/main/universalaimbot.lua", true))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Button Example",
   Callback = function()
        local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")

local Settings = {
    ESP_Enabled = true,
    ESP_TeamCheck = false,
    Chams = true,
    Chams_Color = Color3.fromRGB(0, 0, 255),
    Chams_Transparency = 0.9,
    Chams_Glow_Color = Color3.fromRGB(255, 0, 0),
    Glow_Transparency = 0.3
}

local function DestroyChams(character)
    for _, part in ipairs(character:GetChildren()) do
        if part:IsA("BasePart") and part.Transparency ~= 1 then
            local glow = part:FindFirstChild("Glow")
            local chams = part:FindFirstChild("Chams")

            if glow then glow:Destroy() end
            if chams then chams:Destroy() end
        end
    end
end

RunService.Heartbeat:Connect(function()
    if Settings.ESP_Enabled then
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local humanoid = player.Character:FindFirstChild("Humanoid")
                if humanoid and humanoid.Health > 0 then
                    if not (Settings.ESP_TeamCheck and player.Team == LocalPlayer.Team) then
                        local character = player.Character

                        for _, part in ipairs(character:GetChildren()) do
                            if part:IsA("BasePart") and part.Transparency ~= 1 then
                                if Settings.Chams then
                                    if not part:FindFirstChild("Glow") and not part:FindFirstChild("Chams") then
                                        local chamsBox = Instance.new("BoxHandleAdornment", part)
                                        chamsBox.Name = "Chams"
                                        chamsBox.AlwaysOnTop = true
                                        chamsBox.ZIndex = 4
                                        chamsBox.Adornee = part
                                        chamsBox.Color3 = Settings.Chams_Color
                                        chamsBox.Transparency = Settings.Chams_Transparency
                                        chamsBox.Size = part.Size + Vector3.new(0.02, 0.02, 0.02)

                                        local glowBox = Instance.new("BoxHandleAdornment", part)
                                        glowBox.Name = "Glow"
                                        glowBox.AlwaysOnTop = false
                                        glowBox.ZIndex = 3
                                        glowBox.Adornee = part
                                        glowBox.Color3 = Settings.Chams_Glow_Color
                                        glowBox.Size = chamsBox.Size + Vector3.new(0.13, 0.13, 0.13)
                                        glowBox.Transparency = Settings.Glow_Transparency
                                    end
                                else
                                    DestroyChams(character)
                                end
                            end
                        end
                    else
                        DestroyChams(player.Character)
                    end
                else
                    DestroyChams(player.Character)
                end
            end
        end
    else
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local humanoid = player.Character:FindFirstChild("Humanoid")
                if humanoid and humanoid.Health > 0 then
                    DestroyChams(player.Character)
                end
            end
        end
    end
end)
   end,
})
