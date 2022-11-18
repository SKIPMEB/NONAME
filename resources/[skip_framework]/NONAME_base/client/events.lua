


-- Callback Events --

-- Client Callback
RegisterNetEvent('NONAME:Client:TriggerClientCallback', function(name, ...)
    NONAME.Functions.TriggerClientCallback(name, function(...)
        TriggerServerEvent('NONAME:Server:TriggerClientCallback', name, ...)
    end, ...)
end)

-- Server Callback
RegisterNetEvent('NONAME:Client:TriggerCallback', function(name, ...)
    if NONAME.ServerCallbacks[name] then
        NONAME.ServerCallbacks[name](...)
        NONAME.ServerCallbacks[name] = nil
    end
end)
