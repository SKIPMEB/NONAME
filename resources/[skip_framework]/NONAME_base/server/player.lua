NONAME.Players = {}
NONAME.Player = {}


--player
RegisterNetEvent('NONAME_base:server:Updateplayer')
AddEventHandler('NONAME_base:server:Updateplayer',function ()
    local source = source
    local player = NONAME.Functions.GetPlayer(source)
    if player then
        NONAME.Player.Functions.save()
    end
end)
--character sql stuff
NONAME.Functions.createdPlayer = function (source, Data)
    MySQL.insert('INSERT INTO players (identifier,license,name,cash,bank) VALUES (@identifier,@license,@name,@cash,@bank)', {
        ['@identifier'] = Data.identifier,
        ['@license'] = Data.license,
        ['@name'] = Data.name,
        ['@cash'] = Data.cash,
        ['@bank'] = Data.bank,
  })
  print('[NONAME_base]  '..Data.name..' Was created Good')

  NONAME.Functions.LoadPlayer(source,Data)
end

NONAME.Functions.LoadPlayer = function (source,Data,cid)
    local src = source
    local identifier = pData.identifier
    
    Citizen.Wait(7)
    MySQL.select('select FROM players WHERE identifier= @identifier and @cid',{['@identifier']= identifier,['@cid']= cid}, function (result)

        MySQL.update('update FROM players SET name= @name WHERE identifier= @identifier and @cid',{['@identifier']= identifier,['@name']= pData.name,['@cid']= cid})
        
        NONAME.Player.LoadData(source,identifier,cid)
        Citizen.Wait(7)
        local player = NONAME.Functions.GetPlayer(source)
        TriggerClientEvent('NONAME_SetCharData',source {
            identifier = result[1].identifier,
            license = result[1].license,
            cid = result[1].cid,
            name = result[1].name,
            cash = result[1].cash,
            bank = result[1].bank,
            Citizenid = result[1].Citizenid,
        })
        TriggerClientEvent('NONAME_base:PlayerLoad',source)

    end)
end