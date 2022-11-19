

--Webhooks
function NONAME.joinLog(title, message)

    local webHook = "https://discord.com/api/webhooks/1043230178496753744/Rjtz7loMccucLUv8HPmW88IbXj7CBaX5KUwvciR1Z0iNQin9CqdU1Ov9u4e3scA0FCEN"
    local embedData = {{
        ['title'] = title,
        ['color'] = 0x000000,
        ['author'] = {
            ['name'] = "NONAME Logs",
            ['icon_url'] = "https://cdn.discordapp.com/emojis/939245183621558362.webp?size=128&quality=lossless"
        },
        --['description'] = "Steam HexID: " ..steam.. "\n IP: " ..ip.. "\n CFX Id: " ..fivem.. "\n Discord: <@" ..discord.. "> [" ..discord.. ("]") "\n Microsoft ID: " ..live.. "\n Rockstar License: " ..license.. "\n Rockstar License 2: " ..license2.. "\n Xbox Live ID: " ..live,
        ['description'] = message,
    }}
    PerformHttpRequest(webHook, nil, 'POST', json.encode({
        username = 'Logs',
        embeds = embedData
    }), {
        ['Content-Type'] = 'application/json'
    })
  end