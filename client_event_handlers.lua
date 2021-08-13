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

    env.info("Client connected!")
    env.info(unit_name)

    MESSAGE:New("Welcome, " .. player_name):ToGroup(group)
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
--ClientSet:ForEachClient(
--        function(_client)
--            env.info("Client connected")
--            env.info(_client:GetClientGroupName())
--            _client:HandleEvent(EVENTS.PlayerEnterAircraft)
--
--            function _client:OnEventPlayerEnterAircraft(_event_data)
--                local name = _event_data.IniUnitName
--                local client_name = _client:GetPlayer()
--                MESSAGE:New("Welcome, " .. client_name, 20):ToClient(_client)
--            end
--        end
--)


MESSAGE:New("Client event handlers loaded"):ToAll()