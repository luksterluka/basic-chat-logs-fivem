-- Hi this is VERY basic webhook chat logger script. This is more like a base webhook script, so you can build on top of it yourself (You have 100% free will)

local discord_webhooks = {
    url = "",   --- your webhook
    image = ""
}

AddEventHandler("chatMessage", function(source, author, text)

    if string.find(text, "@everyone") or string.find(text, "@here") then           --- you can add your own
        return
    end

    PerformHttpRequest(discord_webhooks.url, 
    function(err, text, header) end, 
    'POST', 
    json.encode({username = author, content = text, avatar_url=discord_webhooks.image }), {['Content-Type'] = 'application/json'}) 
end)
