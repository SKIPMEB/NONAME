NONAME = {}
NONAME.ClientCallbacks = {}
NONAME.ServerCallbacks = {}


-- To use this export in a script instead of manifest method
-- Just put this line of code below at the very top of the script
-- local NONAME = exports['NONAME_base']:GetNONAME()

exports('GetNONAME', function()
    return NONAME
end) 