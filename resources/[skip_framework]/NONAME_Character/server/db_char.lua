NONAME = exports['NONAME_base']:GetNONAME()

NONAME.DB = NONAME.DB or {}

NONAME.DB.LoadCharacther = function(source, license, identifier, cid)
    local src = source
    local PlayerData = {
        identifier = identifier,
        license = license,
        cid = cid,
        name = GetplayerName(src),
        cash = NONAME.Starting.Cash,
        bank = NONAME.Starting.Bank,
    }
    
    NONAME.Functions.LoadPlayer(source, PlayerData, cid)
end

NONAME.DB.doseUserExist = function(identifier, callback)
    TriggerEvent('NONAME_base:server:doseUserExist',identifier, callback)
end

NONAME.DB.SavePlayer = function(source, identifier)
    print('[NONAME_base] ' .. GetPlayerName(source) .. ' was saved success')
end