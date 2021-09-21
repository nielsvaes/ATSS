ALL_SPAWNED_GROUPS = {}
ALL_SPAWNED_STATICS = {}

---SpawnThreat
---@param kwargs table
---This function takes a table with arguments for ease or readability in your code
---
---MANDATORY ARGUMENTS
---threat_type: string - either THREAT_TYPE.A2A, THREAT_TYPE.A2G or THREAT_TYPE.A2SHIP
---zones:       table - table containing the zones in which the threat should be spawned. These zones need to exist on the map.
---                     You pass the table form of {"MY ZONE NAME 01", "MY ZONE NAME 02"}.
---
---                     For example, let's say you have the following zones on the map:
---                        * A2A DAMASCUS NORTH 01, A2A DAMASCUS NORTH 02, A2A DAMASCUS NORTH 03
---                        * A2A DAMASCUS SOUTH 01, A2A DAMASCUS SOUTH 02, A2A DAMASCUS SOUTH 03
---                        * A2A DAMASCUS WEST 01, A2A DAMASCUS WEST 02, A2A DAMASCUS WEST 03
---                        * A2A AL RAQQA WEST 01, A2A AL RAQQA WEST 02, A2A AL RAQQA WEST 03
---                        * A2A AL RAQQA EAST 01, A2A AL RAQQA EAST 02, A2A AL RAQQA EAST 03
---
---                     If you want to spawn the threat anywhere around Damascus, you could do pass "A2A DAMASCUS" as the argument
---                     and this would return all 9 Damascus zones.
---                     Let's say you only want to threats to come from the north, you could pass "A2A DAMASCUS NORTH"
---                     and the thrats would only spawn in A2A DAMASCUS NORTH 01, A2A DAMASCUS NORTH 02, A2A DAMASCUS NORTH 03
---                     If you want all A2A zones on the map, you could pass "A2A" and threats would be spawned in the zones for
---                     both Damascus and Al Raqqa, because every zone has "A2A" in it.
---
---OPTIONAL ARGUMENTS
---groups: string or table          - Name of the group(s) you want to spawn. This can be a normal string ("A2A ACE") or a table containing multiple strings
---                                   ({"JF-17 BANDITS", "F-18 BANDITS"})
---                                   Ideally, you should always have a group in the mission that has the word "RANDOM" (all capital) in its name.
---                                   This is the group the function will default to if you don't pass the groups argument
---
---                                   Let's try to set up an example.
---                                   Say you have 7 airplane groups on the map set to late activation
---                                     * A2A ROOKIE 1 SHIP     -> skill set to ROOKIE in ME
---                                     * A2A ROOKIE 2 SHIP     -> skill set to ROOKIE in ME
---                                     * A2A ROOKIE 3 SHIP     -> skill set to ROOKIE in ME
---                                     * A2A ACE               -> skill set to ace in ME
---                                     * A2A RANDOM 4 SHIP     -> skill set to random in ME
---                                     * A2A RANDOM 2 SHIP     -> skill set to random in ME
---                                     * RAPTOR GROUP          -> a group that's very specific
---                                     * CROW GROUP            -> a group that's very specific
---                                   You would pass either part of the name or the whole name as the groups argument.
---                                   For example: if you pass "2 SHIP" as the groups argument, the function would spawn random groups of
---                                   "A2A RANDOM 2 SHIP" and "A2A ROOKIE 2 SHIP".
---                                   Another example: you only want to spawn ROOKIE groups and don't really care which ones. You would pass in "ROOKIE" as the
---                                   groups argument to get "A2A ROOKIE 1 SHIP", "A2A ROOKIE 2 SHIP", "A2A ROOKIE 3 SHIP"
---                                   Another example: you want to spawn RAPTOR GROUP and ACE and any 2 SHIP group. Then you'd pass a table to the groups argument
---                                   like this {"RAPTOR GROUP", "ACE", "2 SHIP"} to have the function pick from the following groups:
---                                   "RAPTOR GROUP", "A2A ACE", "A2A ROOKIE 2 SHIP" and "A2A RANDOM 2 SHIP"
---
---size: int                        - number of groups that will be spawned. Not necessarily the number of actual planes, vehicles or ships. If all of your LATE ACTIVATION
---                                   groups consist of 8 vehicles and you set size to 6, you'd get 6 groups of 8 vehicles. Total number of vehicles that are spawned will
---                                   be 48
---threat_spawner: string           - the LATE ACTIVATION group that will be used to spawn the groups. The groups will get the initial heading, waypoints and inital speed from the threat_spawner.
---                                   If none is given, the function will default to the value of A2A.spawner/A2G.spawner/A2SHIP.spawner, set in constants.lua.
---                                   So make sure there is a group on the map that has this name set.
---
---                                   You can have multiple of these spawner groups for different purposes.
---                                   For example: you want to spawn 4 static tanks and 2 moving tanks. You would make one LATE ACTIVATION ground group named "A2G TANKS STATIC SPAWNER"
---                                   and another one called "A2G TANKS MOVING SPAWNER". "A2G TANKS MOVING SPAWNER" will need a couple of waypoints set, "A2G TANKS STATIC SPAWNER" shouldn't have any waypoints.
---
---                                   You can then call the function twice, once for the static tanks and once for the moving tanks like this:
---
---                                   SpawnThreat{
---                                     threat_type = THREAT_TYPE.A2G,
---                                     zones = "TANK ZONES",
---                                     threat_spawner = "A2G TANKS STATIC SPAWNER",
---                                     size = 4
---                                   }
---
---                                   SpawnThreat{
---                                     threat_type = THREAT_TYPE.A2G,
---                                     zones = "TANK ZONES",
---                                     threat_spawner = "A2G TANKS MOVING SPAWNER",
---                                     size = 2
---                                   }
---
---alias_name: string               - name that the spawned threats will receive. If this value is not set, If none is given,
---                                   the function will default to the value of A2A.threat/A2G.threat/A2SHIP.threat
---notify: bool                     - whether or not the coalition should be notified when threats are spawned. Defaults to true
---clear_first: bool                - whether or not to remove any existing groups that share the alias_name before spawning new ones.
---                                   This value defaults to false, so anything new you spawn will be appended to the already existing groups.
---                                   Set to true to start fresh
---size: int                        - how many groups should be spawned. This value defaults to a random number between DEFAULTS.spawn_min and DEFAULTS.spawn_max
---                                   in constants.lua
---waypoint_offset_min: float       - How much minimal offset should be applied to the waypoints in nautical miles. Defaults to 0, so no offset
---waypoint_offset_max: float       - How much maximal offset should be applied to the waypoints in nautical miles. Defaults to 0, so no offset
--SpawnThreat(type, zones, groups, threat_spawner, alias_name, waypoint_offset_min, waypoint_offset_max, notify, clear_first )
function SpawnThreat(kwargs)
    -- check which type of threat we need to spawn and set default values
    if kwargs.threat_type == THREAT_TYPE.AIR then
        kwargs.groups = kwargs.groups or AIR.random
        kwargs.threat_spawner = kwargs.threat_spawner or AIR.spawner
        kwargs.alias_name = kwargs.alias_name or AIR.threat
    elseif kwargs.threat_type == THREAT_TYPE.GROUND then
        kwargs.groups = kwargs.groups or GROUND.random
        kwargs.threat_spawner = kwargs.threat_spawner or GROUND.spawner
        kwargs.alias_name = kwargs.alias_name or GROUND.threat
    elseif kwargs.threat_type == THREAT_TYPE.SHIP then
        kwargs.groups = kwargs.groups or SHIP.random
        kwargs.threat_spawner = kwargs.threat_spawner or SHIP.spawner
        kwargs.alias_name = kwargs.alias_name or SHIP.threat
    end

    -- more defaults
    if kwargs.notify == nil then kwargs.notify = true else kwargs.notify = kwargs.notify end
    if kwargs.clear_first == nil then kwargs.clear_first = false else kwargs.clear_first = kwargs.clear_first end


    -- if size is a table, pick a random number between the numbers in the table
    if type(kwargs.size) == "table" then
        kwargs.size = math.random(kwargs.size[1], kwargs.size[2])
    else
        -- check if size is not nil, if it is generate a random number
        -- if it's not, use the value that's passed
        kwargs.size = kwargs.size or math.random(DEFAULTS.spawn_min, DEFAULTS.spawn_max)
    end

    -- convert NM to KM, since it's easier to deal with NM in the ME
    waypoint_offset_min = NauticalMilesToKilometres(kwargs.waypoint_offset_min) or 0
    waypoint_offset_max = NauticalMilesToKilometres(kwargs.waypoint_offset_max) or 0
    local waypoint_offset = math.random(waypoint_offset_min, waypoint_offset_max)

    -- make sure we're always dealing with a table when checking the zones
    if type(kwargs.zones) == "string" then
        kwargs.zones = {kwargs.zones}
    end

    -- search the map for usable zones and put them in spawn_zones
    local spawn_zones = {}
    for _, zone in pairs(kwargs.zones )do
        local found_zones = GetZonesContaining(zone)
        if found_zones then
            for _, found_zone in pairs(found_zones) do
                table.insert(spawn_zones, found_zone)
            end
        end
    end

    -- make sure we're always dealing with a table when checking the groups
    if type(kwargs.groups) == "string" then
        kwargs.groups = { kwargs.groups }
    end

    -- search the map for usuable groups and put them in threats
    local threats = {}
    -- MOOSE's InitRandomizeTemplate needs strings, not actual objects, so we have to grab the names of everything in the threats array
    local threat_names = {}
    for _, group in pairs(kwargs.groups) do
        local found_groups = GetGroupsContaining(group, false)
        if found_groups then
            for _, found_group in pairs(found_groups) do
                table.insert(threats, found_group)
                table.insert(threat_names, found_group.GroupName)
            end
        end
    end

    -- if we're not allowed to append to the existing threats, we're gonna nuke them all before spawning anything else
    if kwargs.clear_first then
        DestroyAllGroupsContaining(kwargs.alias_name)
    end

    alias_name = kwargs.alias_name .. string.format("%03d", #GetGroupsContaining(kwargs.alias_name) + 1)
    local group = SPAWN:NewWithAlias(kwargs.threat_spawner, alias_name)
                       :InitRandomizeZones(spawn_zones)
                       :InitRandomizeTemplate(threat_names)
                       :InitRandomizeRoute(1, 0, waypoint_offset) -- from the first waypoint until the last one

    for i=1, kwargs.size do
        env.info("Spawning " .. string.format("%02d", i))

        if kwargs.threat_type == THREAT_TYPE.GROUND then
            group:InitGroupHeading(0, 360)
        end
        group:Spawn()
    end

    table.insert(ALL_SPAWNED_GROUPS, group)

    if kwargs.notify then
        MESSAGE:New("Threat spawned"):ToAll()
        MESSAGE:New("Threat type: " .. kwargs.threat_type):ToAll()
        MESSAGE:New("Threat number: " .. kwargs.size):ToAll()
    end
end


---SpawnSpecificGroup
---@param group_name string
---Spawns a specific group that you have placed on the map.
---Group must be set to LATE ACTIVATION
---Group can be respawned after being destroyed
function SpawnSpecificGroup(group_name, notify)
    local group = SPAWN:New(group_name)
    group:Spawn()

    notify = notify or true

    if notify then
        MESSAGE:New("Group spawned: " .. group_name):ToAll()
    end

    table.insert(ALL_SPAWNED_GROUPS, group)
end


---SpawnStaticObject
---@param category string
---@param type string
---@param country string
---@param zones_names string
---@param amount int
---@param heading_min int
---@param heading_max int
--function SpawnStaticObject(category, types, country, zones, amount, alias_name, heading_min, heading_max, random_in_zone)
function SpawnStaticObject(kwargs)
    kwargs.amount = kwargs.amount or 1
    kwargs.heading_min = kwargs.heading_min or 0
    kwargs.heading_max = kwargs.heading_max or 360
    kwargs.alias_name = kwargs.alias_name or "STATIC_"
    if kwargs.random_in_zone == nil then kwargs.random_in_zone = true else kwargs.random_in_zone = kwargs.random_in_zone end

    -- make sure headings are clamped between 0 and 360
    local heading_min = Clamp(kwargs.heading_min, 0, 360)
    local heading_max = Clamp(kwargs.heading_max, 0, 360)

    if type(kwargs.types) == "string" then
        kwargs.types = {kwargs.types}
    end

    -- make sure we're always dealing with a table when checking the zones
    if type(kwargs.zones) == "string" then
        kwargs.zones = {kwargs.zones}
    end

    -- search the map for usable zones and put them in spawn_zones
    local spawn_zones = {}
    for _, zone in pairs(kwargs.zones) do
        local found_zones = GetZonesContaining(zone)
        if found_zones then
            for _, found_zone in pairs(found_zones) do
                table.insert(spawn_zones, found_zone)
            end
        end
    end

    -- spawn as many statics as the amount given
    local static_type
    local static_object
    for _ = 1, kwargs.amount do
        static_type = kwargs.types[math.random(#kwargs.types)] -- pick a random type in case we have multiple
        local zone = spawn_zones[math.random(#spawn_zones)] -- pick a random zone in case we have multiple
        local static_object = SPAWNSTATIC:NewFromType(static_type, kwargs.category, kwargs.country)
                                         :InitNamePrefix(kwargs.alias_name .. static_type .. tostring(math.random(0, 90000))) -- make sure it has a random name

        local position
        if kwargs.random_in_zone then
            position = zone:GetRandomPointVec2()
        else
            position = zone:GetPointVec2(0)
        end
        static_object:SpawnFromPointVec2(position, math.random(heading_min, heading_max))
    end
    MESSAGE:New("Spawned " .. static_type .. " times " .. tostring(kwargs.amount)):ToAll()
    return static_object
end



-----------------------------------------------------------------------
---
---  BASIC CHECKS
---
-----------------------------------------------------------------------


--if #GetGroupsContaining(AIR.random, false) == 0 then
--    MESSAGE:New("WARNING: Can't find an AIR RANDOM group! If you're spawning air threats, make sure you've named them all!", 15):ToAll()
--end
--if #GetGroupsContaining(GROUND.random, false) == 0 then
--    MESSAGE:New("WARNING: Can't find an GROUND RANDOM group! If you're spawning ground threats, make sure you've named them all!", 15):ToAll()
--end
--if #GetGroupsContaining(SHIP.random, false) == 0 then
--    MESSAGE:New("WARNING: Can't find an SHIP RANDOM group! If you're spawning ship threats, make sure you've named them all!", 15):ToAll()
--end


MESSAGE:New("Threat spawners loaded"):ToAll()