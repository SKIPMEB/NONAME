NONAME = {}
NONAME.PlayerData = {}
NONAME.ClientCallbacks = {}
NONAME.ServerCallbacks = {}



--[[
-- Rich Presence Discord
Citizen.CreateThread(function()
    
    while true do
        local player = GetPlayerPed(-1)
        local PlayerName = GetPlayerName(PlayerId())
        local id = GetPlayerServerId(PlayerId())

        Citizen.Wait(5*1000)
        --App ID from developer portal
        SetDiscordAppId(INSERT_APP_ID_HERE_:D)

     
        SetDiscordRichPresenceAsset("logo")
        --Presence Title
        SetDiscordRichPresenceAssetText("NONAME")
        --Presence Text
        SetRichPresence(id.." | " ..PlayerName)
        --Clickable Buttons [Max 2]
        SetDiscordRichPresenceAction(0, "Discord", "https://discord.gg/EdRpJUBKG9")
        SetDiscordRichPresenceAction(1, "Anslut", "fivem://connect/127.0.0.1:30120")
        --SetDiscordRichPresenceAction(1, "Ansök", "https://www.google.com")
        
    end

end)
-----------------------
]]




exports('GetNONAME', function()
    return NONAME
end)
