
--On Join Optimera
AddEventHandler('playerConnecting',function (name, setKickReasson,deferrals)
    local source = source
    local identifiers = GetPlayerIdentifiers(source)
    
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

--FROM START
NONAME.Functions.RegisterServerCallback = function(name, cb)
	NONAME.ServerCallbacks[name] = cb
end


NONAME.Functions.TriggerServerCallback = function(name, requestId, source, cb, ...)
	if NONAME.ServerCallbacks[name] ~= nil then
		NONAME.ServerCallbacks[name](source, cb, ...)
	end
end


-- Callback Events --

-- Client Callback
RegisterNetEvent('NONAME:Server:TriggerClientCallback', function(name, ...)
    if NONAME.ClientCallbacks[name] then
        NONAME.ClientCallbacks[name](...)
        NONAME.ClientCallbacks[name] = nil
    end
end)

-- Server Callback
RegisterNetEvent('NONAME:Server:TriggerCallback', function(name, ...)
    local src = source
    NONAME.Functions.TriggerCallback(name, src, function(...)
        TriggerClientEvent('NONAME:Client:TriggerCallback', src, name, ...)
    end, ...)
end)
