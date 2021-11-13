ClientSet = SET_CLIENT:New()
                      :FilterStart()

function SetEventHandler()
    ClientBirth = ClientSet:HandleEvent(EVENTS.PlayerEnterAircraft)
    ClientDead = ClientSet:HandleEvent(EVENTS.Kill)
    --ClientHit = ClientSet:HandleEvent(EVENTS.Hit)
    --ClientWeaponRelease = ClientSet:HandleEvent(EVENTS.Shot)
    --ClientLand = ClientSet:HandleEvent(EVENTS.Land)

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
    --MESSAGE:New("Message for client"):ToClient(client)
    --client:Message("Testing client:Message")
end

function ClientSet:OnEventKill(event_data)
    local player_name = event_data.IniPlayerName or "AI"
    local target_type_name = event_data.TgtTypeName or "UNDEFINED TARGET TYPE NAME"

    if player_name ~= "AI" then
        message = player_name .. " destroyed " .. target_type_name
    end
    MESSAGE:New(message, 10):ToAll()
end

--function ClientSet:OnEventHit(event_data)
--    local player_name = event_data.IniPlayerName
--    local target_type_name = event_data.TgtTypeName
--
--    MESSAGE:New(player_name .. " hit " .. target_type_name, 10):ToAll()
--end

function ClientSet:OnEventLand(event_data)
    local unit = event_data.IniUnit
    ammo = unit:GetAmmo()
    PrintTable(ammo)
end


function ClientSet:OnEventShot(event_data)
    local unit = event_data.IniUnit
    ammo = unit:GetAmmo()
    for _, ammo_table in pairs(ammo) do
        --PrintTable(ammo_table)
    end



    --local weapon = event_data.WeaponName
    --MESSAGE:New(weapon .. " was released!", 25):ToAll()
    --
    --file = io.open("C:/testfile.txt")
    --file:write(weapon .. " was released!\n")
    --file:close()
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