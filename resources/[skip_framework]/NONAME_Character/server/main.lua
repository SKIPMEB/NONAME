NONAME = exports['NONAME_base']:GetNONAME()

RegisterNetEvent('NONAME_Character:Char:Join')
AddEventHandler('NONAME_Character:Char:Join',function()
    local src = source
    local id
    for k,v in ipairs(GetPlayerIdentifiers(src)) do
        if string.sub(v, 1, string.len('steam:')) then
            id = v
        end
    end

    if not id then
        DropPlayer(src, 'Steam not find')
    else
        
        TriggerClientEvent('NONAME_Character:Char:setupCharacters', src)
    end
end)


RegisterServerEvent('NONAME_Character:Char:ServerSelect')
AddEventHandler('NONAME_Character:Char:ServerSelect', function(cid)
    local src = source
    local identifier = GetPlayerIdentifiers(src)[1]
    local license = GetPlayerIdentifiers(src)[2]

    NONAME.DB.LoadCharacther(src,license,identifier,cid)
end)

NONAME.Functions.RegisterServerCallback('NONAME_Character:getChar', function(source,cb)--Will send all characther
    local id = GetPlayerIdentifiers(src)[1]
    MySQL.query('SELECT * from users WHERE identifier = ?', {identifier}, function(result)
        if result then
            cb(result)
        end
    end)
end)

RegisterServerEvent('NONAME_Character:deleteChar')
AddEventHandler('NONAME_Character:deleteChar', function(chardata)
    local cid = chardata.cid
    local name = 'First: ' .. chardata.firstname .. 'Last: ' .. chardata.lastname .. ""
    local src = source
    local identifier = GetPlayerIdentifiers(src)[1]
    local charname = 'First: ' .. chardata.firstname .. 'Last: ' .. chardata.lastname .. ""
    
    local citizenid = '' .. cid .. '-' .. identifier .. ''

    MySQL.query('DELETE FROM players WHERE citizenid = ?',{citizenid})

    TriggerClientEvent('NONAME_Character:Char:setupCharacters', src)
end)

RegisterServerEvent('NONAME_Character:server:createCharacter')
AddEventHandler('NONAME_Character:server:createCharacter', function(cData)
    local src = source
    local identifier = GetPlayerIdentifiers(src)[1]
    local license = GetPlayerIdentifiers(src)[2]
    local name = GetPlayerName(src)
    local cid = cData.cid
    local citizenid = '' .. cid .. '-' .. identifier .. ''
    local charname = 'First: ' .. cData.firstname .. 'Last: ' .. cData.lastname .. ""

    MySQL.insert('INSERT INTO players (identifier, license, name, cid, cash, bank, firstname, lastname, sex, dob, phone ,citizenid) VALUES (@identifier, @license, @name, @cid, @cash, @bank, @firstname, @lastname, @sex, @dob, @phone, @citizenid)', {
        ['@identifier'] = identifier,
        ['@license'] = license,
        ['@name'] = name,
        ['@cid'] = cid,
        ['@cash'] = 100,
        ['@bank'] = 1000,
        ['@firstname'] = cData.firstname,
        ['@lastname'] = cData.lastname,
        ['@sex'] = cData.sex,
        ['@dob'] = cData.dob,
        ['@phone'] = math.random(00000000,99999999),
        ['@citizenid'] = citizenid
  })
    TriggerClientEvent('NOMANE_Character:Char:setupCharacters',src)
end)