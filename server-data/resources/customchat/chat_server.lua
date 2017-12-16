Tunnel = module("vrp", "lib/Tunnel")
Proxy = module("vrp", "lib/Proxy")

vRPcc = {}
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","customchat")
BMclient = Tunnel.getInterface("customchat","customchat")
vRPcc = Tunnel.getInterface("customchat","customchat")
Tunnel.bindInterface("customchat",vRPcc)
lcfg = module("vrp", "cfg/base")

RegisterServerEvent('chatCommandEntered')
RegisterServerEvent('chatMessageEntered')

-- functions
function stringSplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

function vRPcc.getMyRPidentity()
   local user_id = vRP.getUserId(source)
   local identity = vRP.getUserIdentity(user_id)
        return user_id, identity
end

-- main event
AddEventHandler('chatMessageEntered', function(name, color, message)
    if not name or not color or not message or #color ~= 3 then
        return
    end
	
    if message:sub(1, 1) == "/" then
        fullcmd = stringSplit(message, " ")
        cmd = fullcmd[1]
		local msg = fullcmd[2]
		for k,v in ipairs(fullcmd) do
			if k > 2 then
				msg = msg .. " " .. fullcmd[k]
			end
		end

        if cmd == "/me" then
			if msg ~= nil then
				TriggerClientEvent("sendProximityMessageMe", -1, source, name, tostring(msg))
			end
        	CancelEvent()
        end
		
        if cmd == "/do" then
			if msg ~= nil then
				TriggerClientEvent("sendProximityMessageDo", -1, source, name, tostring(msg))
			end
        	CancelEvent()
        end
		
        if cmd == "/g" then
            if msg ~= nil then
              local user_id = vRP.getUserId(source)
              local identity = vRP.getUserIdentity(user_id)
                TriggerClientEvent("sendGlobalMessage", -1, source, name, tostring(msg),user_id,identity)
            end
            CancelEvent()
        end

        if cmd == "/twitter" then
            if msg ~= nil then
              local user_id = vRP.getUserId(source)
              local identity = vRP.getUserIdentity(user_id)
                TriggerClientEvent("sendTwitterMessage", -1, source, name, tostring(msg),user_id,identity)
            end
            CancelEvent()
        end
		
        if cmd == "/ooc" then
            if msg ~= nil then
              local user_id = vRP.getUserId(source)
              local identity = vRP.getUserIdentity(user_id)
                TriggerClientEvent("sendOOCMessage", -1, source, name, tostring(msg),user_id,identity)
            end
            CancelEvent()
        end
	else
		if not WasEventCanceled() then
			TriggerClientEvent('sendProximityMessage', -1, source, name, message)
        	CancelEvent()
		end
	end

	TriggerEvent('chatMessage', source, name, message)
    print(name .. ': ' .. message)
end)

-- rcon say command handler
AddEventHandler('rconCommand', function(commandName, args)
    if commandName == "say" then
        local msg = table.concat(args, ' ')

        TriggerClientEvent('chatMessage', -1, 'console', { 0, 0x99, 255 }, msg)
        RconPrint('[AVISO] Server: ' .. msg .. "\n")

        CancelEvent()
    end
end)

-- rcon tell command handler
AddEventHandler('rconCommand', function(commandName, args)
    if commandName == "tell" then
        local target = table.remove(args, 1)
        local msg = table.concat(args, ' ')

        TriggerClientEvent('chatMessage', tonumber(target), 'console', { 0, 0x99, 255 }, msg)
        RconPrint('[AVISO] Server: ' .. msg .. "\n")

        CancelEvent()
    end
end)

--player join messages -- deactivated by default, uncomment to activate
AddEventHandler("vRP:playerSpawn", function(user_id, source, first_spawn)
    --player join messages -- deactivated by default, uncomment to activate
    local identity = vRP.getUserIdentity(user_id)
        TriggerClientEvent('chatMessage', -1, 'SERVER', { 0, 255, 0, 0.3 }, '' .. identity.name ..' ' .. identity.firstname .. ' has entered the city.')
end)