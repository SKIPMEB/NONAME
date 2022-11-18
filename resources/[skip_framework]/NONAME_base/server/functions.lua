NONAME.Functions = {}
--Getter
function NONAME.Functions.GetIdentifier(source, idtype)
    local identifiers = GetPlayerIdentifiers(source)
    for _, identifier in pairs(identifiers) do
        if string.find(identifier, idtype) then
            return identifier
        end
    end
    return nil
end

function NONAME.Functions.GetSource(identifier)
    for src, _ in pairs(NONAME.Players) do
        local idens = GetPlayerIdentifiers(src)
        for _, id in pairs(idens) do
            if identifier == id then
                return src
            end
        end
    end
    return 0
end

function NONAME.Functions.GetPlayer(source)
    if type(source) == 'number' then
        return NONAME.Players[source]
    else
        return NONAME.Players[NONAME.Functions.GetSource(source)]
    end
end

--On start


--On Join
AddEventHandler('playerConnecting',function (name, setKickReasson,deferrals)
    local source = source
    local identifiers = GetPlayerIdentifiers(source)
    local identifier
    
    for k, v in ipairs(identifiers) do
        if string.match(v, 'steam:') then
            identifier = v

            break
        end
    end
    if not identifier then 
        deferrals.done('You need to open steam')
    else
        deferrals.done()
        MySQL.scalar('SELECT 1 FROM users WHERE identifier = ?', { 
            identifier
        }, function(result)
            if not result then
                MySQL.insert('INSERT INTO users (identifier) VALUES (@identifier)', {
                      ['@identifier'] = identifier
                })
            end 
     end)
   end 
end)



-- Callback Functions --

-- Client Callback
function NONAME.Functions.TriggerClientCallback(name, source, cb, ...)
    NONAME.ClientCallbacks[name] = cb
    TriggerClientEvent('NONAME:Client:TriggerClientCallback', source, name, ...)
end

-- Server Callback
function NONAME.Functions.CreateCallback(name, cb)
    NONAME.ServerCallbacks[name] = cb
end

function NONAME.Functions.TriggerCallback(name, source, cb, ...)
    if not NONAME.ServerCallbacks[name] then return end
    NONAME.ServerCallbacks[name](source, cb, ...)
end