NONAME = exports['NONAME_base']:GetNONAME()

local selectedChar = false
local cam = nil
local cam2 = nil

local bannedNames = {}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if NetworkIsSessionStarted() then
            TriggerServerEvent('NOMANE_Character:Char:Joined')
            TriggerEvent('NOMANE_Character:Char:StartCamera')
            TriggerEvent('NONAME_ui:client:closeCharui')
            TriggerEvent('NOMANE_Character:PlayerLogin')
            selectedChar(true)
            return
        end
    end
    
end)

RegisterNetEvent('NOMANE_Character:Char:Selecting')
AddEventHandler('NOMANE_Character:Char:Selecting', function()
    selectedChar(true)
end)



GetCID = function (source,cb)
    local src = source
    TriggerServerEvent('NOMANE_Character:GetID',src)
end

RegisterNUICallback('createCharacter',function(data)
    local Chardata = data.Chardata
    for theData, value in pains(CharData) do
        if theData == 'firstname' or theData == 'lastname' then
            reason = verifyname(value)
            print(reason) --removes later
            if reason ~= '' then
                break
            end
        end
    end

        if reason == '' then
            TriggerServerEvent('NOMANE_Character:server:createCharacter')
        end
end)

function verifyName(name)
    for k, v in ipairs(bannedNames) do
        if name == v  then
            local reason = ''
        end
    end
end