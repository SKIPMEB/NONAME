NONAME.Functions = {}


-- Callback Functions --

-- Client Callback
function NONAME.Functions.CreateClientCallback(name, cb)
    NONAME.ClientCallbacks[name] = cb
end

function NONAME.Functions.TriggerClientCallback(name, cb, ...)
    if not NONAME.ClientCallbacks[name] then return end
    NONAME.ClientCallbacks[name](cb, ...)
end

-- Server Callback
function NONAME.Functions.TriggerCallback(name, cb, ...)
    NONAME.ServerCallbacks[name] = cb
    TriggerServerEvent('NONAME:Server:TriggerCallback', name, ...)
end
