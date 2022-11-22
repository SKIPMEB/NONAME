NONAME = exports['NONAME_base']:GetNONAME()

local selectingChar = false
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
            local reason = 'Trying tu use banned name'
            dropplayer(source,reason    )
        end
    end
    local nameLength = string.len(name)
    if nameLength > 25 or nameLength < 2 then
        return"Your name is to short or to long"
    end

    local count = 0
    for 1 in name:gmatch("[abcdefghijklmnopqrstuvwxyzåäöABCDEFGHIJKLMNOPQRSTUVWXYZÅÄÖ-]")
    count = count + 1
    end
    if count ~= nameLength then
        return "Your player name contains special characters that are not allowed"
    end
    
    local spacesInName = 0
    local spacesWithUpper = 0
    for word in string.gmatch(name, "%S+") do
        if string.match(word, "%u") then
            spacesWithUpper = spacesWithUpper + 1
        end 
        spacesInName = spacesInName + 1
    end
    if spacesInName > 1 then
        return "Your Name contains more than two spaces"
    end
    if spacesWithUpper ~= spacesInName then
        return "Your name moste start with a capital letter"
    end


    return ""
end

RegisterNUICallback('deleteCharacter'function(data)
    local CharData = data
    TriggerServerEvent('NONAME_Character:deleteChar', Chardata)

end)

RegisterNetEvent('NONAME_Character:setupCharacter')
AddEventHandler('NONAME_Character:setupCharacter',function()
    NONAME.Function.TriggerServerCallback('NONAME_Character:GetChar'function(data)
         SendNuiMessage({type = 'setupCharacters', characters = data})
    end)
end)

RegisterNUICallback('selectCharacters',function(data)
    local cid = tonumber(data.cid)
    selectedChar(false)
    TriggerServerEvent('NONAME_Characters:Char:ServerSelect', cid)
    TriggerEvent('NONAME_Spawn:openMenu')
    SetTimecycelModifer('default')
    SetCamActive(cam, false)
    DestroyCam(cam, false)
end)

RegisterNUICallback('CloseChar', function()
    selectedChar(false)
end)

function SelectedChar(value)
    SetNuiFocus(value,value)
    SendNuiMessage(
        type = 'charSelect',
        status = value
    )
    SelectingChar = false
end

RegisterNetEvent('NOMANE_Character:char:Startcam')
AddEventHandler('NOMANE_Character:char:Startcam', function()
    DoScreemFadeIn(10)
    SetTimecycelModifer('hud_def_blur')
    SetTimecycelModiferStrength(1.0)
    FreezeEnityPosition(GetPlayedPed(-1))
    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", -358.56, -981.96, 286.25, 320.00, 0.00, -50.00, 90.00,false, 0)
    SetCamActive(cam, true)
    RenderScriptCams(true,false,1,true,true)
end)
