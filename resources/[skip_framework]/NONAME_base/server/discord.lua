







--Webhooks
function NONAME.DiscordLog(name, title, color, message)

    local webHook = "https://discord.com/api/webhooks/1043230178496753744/Rjtz7loMccucLUv8HPmW88IbXj7CBaX5KUwvciR1Z0iNQin9CqdU1Ov9u4e3scA0FCEN"
    local embedData = {{
        ['title'] = title,
        ['color'] = Config.DiscordLogs.Colors[color] or Config.DiscordLogs.Colors.default,
        ['footer'] = {
            ['text'] = "| ÖS:ÅPD Logs | " .. os.date(),
            ['icon_url'] = "https://cdn.discordapp.com/attachments/944789399852417096/1020099828266586193/blanc-800x800.png"
        },
        ['description'] = message,
        ['author'] = {
            ['name'] = "_S_Framework",
            ['icon_url'] = "https://cdn.discordapp.com/emojis/939245183621558362.webp?size=128&quality=lossless"
        }
    }}
    PerformHttpRequest(webHook, nil, 'POST', json.encode({
        username = 'Logs',
        embeds = embedData
    }), {
        ['Content-Type'] = 'application/json'
    })
  end