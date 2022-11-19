NONAME = {}
NONAME.ClientCallbacks = {}
NONAME.ServerCallbacks = {}

RegisterServerEvent('NONAME_base:ServerStart')
AddEventHandler('NONAME_base:ServerStart', function()
    local src = source
    Citizen.CreateThread(function()
        local Identifier = GetPlayerIdentifiers(src)[1]
        if not Identifier then
            DropPlayer(src,"Identifier Not Located")
        end
        return
    end)    
end)
-- To use this export in a script instead of manifest method
-- Just put this line of code below at the very top of the script
-- local NONAME = exports['NONAME_base']:GetNONAME()

exports('GetNONAME', function()
    return NONAME
end) 