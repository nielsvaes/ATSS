ClientSet = SET_CLIENT:New()
                      :FilterOnce()

function SetEventHandler()
    ClientBirth = ClientSet:HandleEvent(EVENTS.PlayerEnterAircraft)
    ClieantDead = ClientSet:HandleEvent(EVENTS.Kill)
end

function ClientSet:OnEventPlayerEnterAircraft(event_data)
    local unit_name = event_data.IniUnitName
    local group = event_data.IniGroup
    local player_name = event_data.IniPlayerName
    local client = CLIENT:FindByName(unit_name)

    -- find _client
    -- do client:Message(something, 20)

    env.info("Client connected!")
    env.info(unit_name)

    MESSAGE:New(player_name .. " joined the server"):ToAll()
    MESSAGE:New("Message for client"):ToClient(client)
end

function ClientSet:OnEventKill(event_data)
    local player_name = event_data.IniPlayerName
    local target_group_name = event_data.TgtGroupName
    local target_type_name = event_data.TgtTypeName

    MESSAGE:New(player_name .. " killed a " .. target_type_name .. " (" .. target_group_name .. ")"):ToAll()
end

SetEventHandler()


--
--ClientSet = SET_CLIENT:New()
--                      :FilterOnce()
--
--env.info("Number of clients: " .. tostring(#ClientSet))
--
--ClientSet:ForEachClient(
--        function(client)
--            env.info(client:GetClientGroupName())
--            client:HandleEvent(EVENTS.PlayerEnterAircraft)
--
--            function client:OnEventPlayerEnterAircraft(event_data)
--                env.info("Client connected")
--                local name = event_data.IniUnitName
--                local client_name = client:GetPlayer()
--                local group = event_data.IniGroup
--                MESSAGE:New("------------------Welcome, " .. client_name, 20):ToGroup(group)
--            end
--        end
--)


MESSAGE:New("Client event handlers loaded"):ToAll()