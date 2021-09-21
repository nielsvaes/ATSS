---GetGroupsContaining
---Returns a table of all the air to air groups that start with a given prefix
---@param substring string
function GetGroupsContaining(substring, as_strings, as_set)
    as_strings = as_strings or false
    as_set = as_set or false

    local group_set = SET_GROUP:New()
                               :FilterPrefixes(substring)
                               :FilterOnce()

    if as_set then
        return group_set
    end

    local group_array = group_set:GetSetObjects()

    if #group_array == 0 then
        env.error("CAN'T FIND ANY GROUPS WITH: (" .. substring .. ")")
    end

    if as_strings then
        local object_names = {}
        for _, group in pairs(group_array) do
            table.insert(object_names, group.GroupName)
        end

        return object_names
    else
        return group_array
    end
end


---GetZonesContaining
---Returns a table of all the zones that start with a given prefix
---@param substring string
function GetZonesContaining(substring, as_strings, as_set)
    as_strings = as_strings or false
    as_set = as_set or false

    local zone_set = SET_ZONE:New()
                             :FilterPrefixes(substring)
                             :FilterOnce()
    if as_set then
        return zone_set
    end

    local zone_array = zone_set:GetSetObjects()

    if #zone_array == 0 then
        env.error("CAN'T FIND ANY ZONES WITH: " .. substring)
    end

    if as_strings then
        local object_names = {}
        for _, zone in pairs(zone_array) do
            table.insert(object_names, zone.ZoneName)
        end

        return object_names
    else
        return zone_array
    end
end

---GetStaticsContaining
---Returns a table of all the air to air groups that start with a given prefix
---@param substring string
function GetStaticsContaining(substring, as_strings)
    as_strings = as_strings or false
    local static_set = SET_STATIC:New()
                                 :FilterPrefixes(substring)
                                 :FilterOnce()
    local static_array = static_set:GetSetObjects()

    if #static_array == 0 then
        env.error("CAN'T FIND ANY STATICS WITH " .. substring)
    end

    if as_strings then
        local static_names = {}
        for _, group in pairs(static_array) do
            table.insert(static_names, group.GroupName)
        end

        return static_names
    else
        return static_array
    end
end


---AnyOfGroupAlive
---@param group_name string
---Returns true if any units of a certain group are still alive
function AnyOfGroupAlive(group_name)
    local set = SET_GROUP:New()
                         :FilterPrefixes(group_name)
                         :FilterOnce()
    local alive_set = set:GetAliveSet()
    -- if we're able to loop, that means something is alive
    for _, alive_set in pairs(alive_bandit_set) do
        return true
    end
    return false
end

---SetUserFlag
---Easier to read than trigger.action.setUserFlag
---@param flag_number int
---@param value int int or bool value
function SetUserFlag(flag_number, value)
    --if not type(flag_number) == "string" then flag_number = tostring(flag_number) end

    trigger.action.setUserFlag(flag_number, value)
end

---GetUserFlag
---Easier to read than trigger.action.getUserFlag
---@param flag_number int
function GetUserFlag(flag_number)
    return trigger.misc.getUserFlag(flag_number)
end


---DestroyAllGroupsContaining
---Destroy all groups containing a string
---@param search_strings void
---@param message string
function DestroyAllGroupsContaining(search_strings, message)
    message = message or nil
    if type(search_strings) == "string" then
        search_strings = { search_strings }
    end

    local destroy_set = {}
    for _, search_string in pairs(search_strings) do
        destroy_set = SET_GROUP:New()
                               :FilterPrefixes(search_string)
                               :FilterOnce()
    end

    local destroyables = destroy_set:GetAliveSet()
    for _, to_destroy_group in pairs(destroyables) do
        to_destroy_group:Destroy()
    end

    if message then
        MESSAGE:New(message, 5):ToAll()
    end
end


---DestroyAllGroupsContaining
---Destroy all groups containing a string
---@param search_strings void
---@param message string
function DestroyAllStaticsContaining(search_strings, message)
    message = message or nil
    if type(search_strings) == "string" then
        search_strings = { search_strings }
    end

    local destroy_set = {}
    for _, search_string in pairs(search_strings) do
        destroy_set = GetStaticsContaining(search_string)
        for _, to_destroy in pairs(destroy_set) do
            to_destroy:Destroy()
        end
    end

    if message then
        MESSAGE:New(message, 5):ToAll()
    end
end


---NauticalMilesToKilometres
---@param miles float
---Oneliner to convert nautical miles to kilometers
function NauticalMilesToKilometres(miles)
    miles = miles or 0
    return miles * 1,852
end


function Clamp(value, min, max)
    if value < min then value = min end
    if value > max then value = max end

    return value
end

---PrintTable
---@param table
---Oneliner to print contents of a table
function PrintTable(table)
    for key, value in pairs(table) do
        env.info("key:" .. tostring(key))
        env.info("value:" .. tostring(value))
    end
end

---PercentageChance
---@param chance int
---Does a random dice roll to see if something with x percent of chance will happen
function PercentageChance(chance)
    local percentage = math.random(0, 100)
    if percentage < chance then
        return true
    end
    return false
end


---ToTable
---@param var any
---If the variable passed is not a table, wrap it in {} to make it one
function EnsureTable(var)
    if type(var) ~= "table" then
        var = {var}
    end
    return var
end
MESSAGE:New("Utils loaded", 5):ToAll()