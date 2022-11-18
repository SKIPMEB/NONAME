
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
